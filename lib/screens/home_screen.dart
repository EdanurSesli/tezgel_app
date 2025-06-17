import 'package:flutter/material.dart';
import 'package:tezgel_app/models/product_model.dart';
import '../services/product_services.dart';
import '../services/storage_service.dart'; // Yeni import

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ProductResponse> _productsFuture;
  String? _selectedCategory;
  String? _selectedLocation;
  String _searchText = '';
  String? _token; // Token için yeni değişken

  final List<Map<String, dynamic>> _categories = const [
    {'title': 'Baklagiller', 'icon': Icons.rice_bowl, 'color': Colors.orangeAccent},
    {'title': 'Sebzeler', 'icon': Icons.eco, 'color': Colors.green},
    {'title': 'Meyveler', 'icon': Icons.apple, 'color': Colors.redAccent},
    {'title': 'Süt Ürünleri', 'icon': Icons.local_drink, 'color': Colors.blueAccent},
    {'title': 'Et & Tavuk', 'icon': Icons.set_meal, 'color': Colors.brown},
    {'title': 'Unlu Mamuller', 'icon': Icons.bakery_dining, 'color': Colors.amber},
  ];

  final List<Map<String, dynamic>> _locations = const [
    {'city': 'İstanbul', 'districts': ['Kadıköy', 'Beşiktaş', 'Üsküdar']},
    {'city': 'Ankara', 'districts': ['Çankaya', 'Keçiören', 'Yenimahalle']},
    {'city': 'İzmir', 'districts': ['Konak', 'Bornova', 'Karşıyaka']},
  ];

  @override
  void initState() {
    super.initState();
    _initializeProducts();
  }

  Future<void> _initializeProducts() async {
    _token = await StorageService.getToken();
    if (_token != null) {
      setState(() {
        _productsFuture = ProductService().getProduct(_token!);
      });
    }
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
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: _buildSearchButton(Icons.location_on, onTap: () => _showLocationFilter(context)),
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
                      final matchesLocation = _selectedLocation == null || product.description.contains(_selectedLocation!);
                      final matchesSearch = _searchText.isEmpty || product.name.toLowerCase().contains(_searchText.toLowerCase());
                      return matchesCategory && matchesLocation && matchesSearch;
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
                                  child: Image.network(
                                    product.imagePath,
                                    width: double.infinity,
                                    height: 180,
                                    fit: BoxFit.cover,
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
                                    Text('₺\${product.originalPrice}', style: const TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                                    const SizedBox(width: 8),
                                    Text('₺\${product.discountedPrice}', style: const TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold)),
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
    // Aynı şekilde devam edecek...
  }

  void _showLocationFilter(BuildContext context) {
    // Aynı şekilde devam edecek...
  }
}
