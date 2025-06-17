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
                  _buildSearchButton(Icons.search, 'Text'),
                  _buildSearchButton(Icons.category, 'Category'),
                  _buildSearchButton(Icons.location_on, 'Location'),
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
                    if (products.isEmpty) {
                      return const Center(child: Text('Ürün bulunamadı.'));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
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

  Widget _buildSearchButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
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
