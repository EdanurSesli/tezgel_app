import 'package:flutter/material.dart';
import 'package:tezgel_app/models/category/category_response.dart';
import 'package:tezgel_app/models/product_models/product_model.dart';
import '../services/product_services.dart';
import '../services/storage_service.dart';
import '../services/category_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ProductResponse> _productsFuture;
  late Future<List<CategoryData>> _categoriesFuture;
  String? _selectedCategory;
  String? _selectedLocation;
  String _searchText = '';
  String? _token;

  final List<Map<String, dynamic>> _locations = const [
    {'city': 'İstanbul', 'districts': ['Kadıköy', 'Beşiktaş', 'Üsküdar']},
    {'city': 'Ankara', 'districts': ['Çankaya', 'Keçiören', 'Yenimahalle']},
    {'city': 'İzmir', 'districts': ['Konak', 'Bornova', 'Karşıyaka']},
  ];

  @override
  void initState() {
    super.initState();
    _initializeProducts();
    _categoriesFuture = _fetchCategories();
  }

  Future<void> _initializeProducts() async {
    _token = await StorageService.getToken();
    if (_token != null) {
      setState(() {
        _productsFuture = ProductService().getProduct(_token!);
      });
    }
  }

  Future<List<CategoryData>> _fetchCategories() async {
    final response = await CategoryService().getCategories();
    return response.data ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text('LOGO', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      height: 48,
                      child: TextField(
                        onChanged: (value) => setState(() => _searchText = value),
                        decoration: InputDecoration(
                          hintText: 'Ürün ara...',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.search, color: Colors.green),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Color(0xFFD7D7E0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Color(0xFFD7D7E0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: _buildSearchButton(Icons.category, onTap: () => _showCategoryFilter(context)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(color: Color(0xFFD7D7E0), thickness: 2, indent: 16, endIndent: 16),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<ProductResponse>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Hata: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    List<Product> products = snapshot.data!.data;
                    var filteredProducts = products.where((product) {
                      final matchesCategory = _selectedCategory == null || product.categoryName == _selectedCategory;
                      final matchesSearch = _searchText.isEmpty || product.name.toLowerCase().contains(_searchText.toLowerCase());
                      return matchesCategory && matchesSearch;
                    }).toList();

                    if (filteredProducts.isEmpty) {
                      return const Center(child: Text('Ürün bulunamadı.'));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: product.imagePath.startsWith('http') 
                                      ? Image.network(
                                          product.imagePath,
                                          width: double.infinity,
                                          height: 180,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              width: double.infinity,
                                              height: 180,
                                              color: Colors.grey[300],
                                              child: const Icon(Icons.image_not_supported, size: 50),
                                            );
                                          },
                                        )
                                      : Container(
                                          width: double.infinity,
                                          height: 180,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.image_not_supported, size: 50),
                                        ),
                                ),
                                const SizedBox(height: 12),
                                Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                _infoRow(Icons.category, product.categoryName),
                                _infoRow(Icons.description, product.description),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Text(
                                      '₺${product.originalPrice.toString()}', 
                                      style: const TextStyle(
                                        fontSize: 16, 
                                        color: Colors.grey, 
                                        decoration: TextDecoration.lineThrough
                                      )
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '₺${product.discountedPrice.toString()}', 
                                      style: const TextStyle(
                                        fontSize: 18, 
                                        color: Colors.orange, 
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    minimumSize: const Size(double.infinity, 50),
                                  ),
                                  child: const Text('Detayları Gör', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFFD7D7E0)),
          const SizedBox(width: 4),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildSearchButton(IconData icon, {required VoidCallback onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFD7D7E0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      child: Icon(icon, color: Colors.green, size: 24),
    );
  }

  void _showCategoryFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder<List<CategoryData>>(
              future: _categoriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Kategori yüklenemedi: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Kategori bulunamadı.'));
                }
                final categories = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const Text(
                      'Kategoriler',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: const Text('Tümü'),
                      leading: const Icon(Icons.all_inclusive, color: Colors.green),
                      selected: _selectedCategory == null,
                      onTap: () {
                        setState(() => _selectedCategory = null);
                        Navigator.pop(context);
                      },
                    ),
                    ...categories.map((category) => ListTile(
                      title: Text(category.name ?? ''),
                      leading: const Icon(Icons.category, color: Colors.blueAccent),
                      selected: _selectedCategory == category.name,
                      onTap: () {
                        setState(() => _selectedCategory = category.name);
                        Navigator.pop(context);
                      },
                    )),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
