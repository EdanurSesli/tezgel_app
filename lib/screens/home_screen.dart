import 'package:flutter/material.dart';
import '../services/product_services.dart';
import '../models/register_models/base_register_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<BaseRegisterResponse> _productsFuture;
  String? _selectedCategory;
  String? _selectedLocation;

  final List<Map<String, dynamic>> _categories = const [
    {
      'title': 'Baklagiller',
      'icon': Icons.rice_bowl,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'Sebzeler',
      'icon': Icons.eco,
      'color': Colors.green,
    },
    {
      'title': 'Meyveler',
      'icon': Icons.apple,
      'color': Colors.redAccent,
    },
    {
      'title': 'Süt Ürünleri',
      'icon': Icons.local_drink,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Et & Tavuk',
      'icon': Icons.set_meal,
      'color': Colors.brown,
    },
    {
      'title': 'Unlu Mamuller',
      'icon': Icons.bakery_dining,
      'color': Colors.amber,
    },
  ];

  final List<Map<String, dynamic>> _locations = const [
    {
      'city': 'İstanbul',
      'districts': ['Kadıköy', 'Beşiktaş', 'Üsküdar']
    },
    {
      'city': 'Ankara',
      'districts': ['Çankaya', 'Keçiören', 'Yenimahalle']
    },
    {
      'city': 'İzmir',
      'districts': ['Konak', 'Bornova', 'Karşıyaka']
    },
  ];

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductService().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              'LOGO',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSearchButton(Icons.search, 'Text', onTap: () {}),
                  _buildSearchButton(Icons.category, 'Category', onTap: () {
                    _showCategoryFilter(context);
                  }),
                  _buildSearchButton(Icons.location_on, 'Location', onTap: () {
                    _showLocationFilter(context);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(color: Color(0xFFD7D7E0), thickness: 2, indent: 16, endIndent: 16),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<BaseRegisterResponse>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Hata: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final products = (snapshot.data?.data ?? []) as List;
                    // Kategori ve lokasyon filtresi uygula
                    var filteredProducts = products;
                    if (_selectedCategory != null) {
                      filteredProducts = filteredProducts.where((product) =>
                        product['productCategory'] == _selectedCategory).toList();
                    }
                    if (_selectedLocation != null) {
                      filteredProducts = filteredProducts.where((product) =>
                        product['productLocation'] == _selectedLocation).toList();
                    }
                    if (filteredProducts.isEmpty) {
                      return const Center(child: Text('Ürün bulunamadı.'));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        // product içeriği modeline göre doldurulmalı
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (product['imagePath'] != null)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      product['imagePath'],
                                      width: double.infinity,
                                      height: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                const SizedBox(height: 12),
                                Text(product['productName'] ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                _infoRow(Icons.location_on, product['productLocation'] ?? ''),
                                _infoRow(Icons.category, product['productCategory'] ?? ''),
                                _infoRow(Icons.access_time, product['productTime'] ?? ''),
                                _infoRow(Icons.apartment, product['businessName'] ?? ''),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    if (product['oldPrice'] != null)
                                      Text('₺${product['oldPrice']}', style: const TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                                    const SizedBox(width: 8),
                                    if (product['newPrice'] != null)
                                      Text('₺${product['newPrice']}', style: const TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(product['description'] ?? '', style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), minimumSize: const Size(double.infinity, 50)),
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

  void _showCategoryFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Kategoriler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ..._categories.map((category) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: category['color'],
                      child: Icon(category['icon'], color: Colors.white),
                    ),
                    title: Text(category['title']),
                    trailing: _selectedCategory == category['title']
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedCategory = category['title'];
                      });
                      Navigator.pop(context);
                    },
                  )),
              ListTile(
                leading: const Icon(Icons.clear),
                title: const Text('Filtreyi Temizle'),
                onTap: () {
                  setState(() {
                    _selectedCategory = null;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLocationFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            final List<Widget> locationWidgets = [
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Center(
                  child: Text(
                    'İl ve İlçeler',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ];

            for (var loc in _locations) {
              locationWidgets.add(
                ListTile(
                  title: Text(loc['city'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  enabled: false,
                ),
              );
              for (var district in loc['districts']) {
                locationWidgets.add(
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.green),
                    title: Text('${loc['city']} - $district'),
                    trailing: _selectedLocation == '${loc['city']} - $district'
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedLocation = '${loc['city']} - $district';
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            }

            locationWidgets.add(
              ListTile(
                leading: const Icon(Icons.clear),
                title: const Text('Filtreyi Temizle'),
                onTap: () {
                  setState(() {
                    _selectedLocation = null;
                  });
                  Navigator.pop(context);
                },
              ),
            );

            return ListView(
              controller: scrollController,
              children: locationWidgets,
            );
          },
        );
      },
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFFD7D7E0)),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSearchButton(IconData icon, String label, {required VoidCallback onTap}) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.green),
      label: Text(label, style: const TextStyle(color: Colors.green)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFD7D7E0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
