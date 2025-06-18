import 'package:flutter/material.dart';
import 'package:tezgel_app/models/product_models/all_product_response.dart';
import '../services/product_services.dart';
import '../models/product_models/product_model.dart';
import '../services/storage_service.dart';

class MyProductsScreen extends StatefulWidget {
  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  Future<AllProductResponse>? _productsFuture;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final token = await StorageService.getToken() ?? '';
    setState(() {
      _productsFuture = ProductService().getAllProducts(token);
    });
  }

  Future<void> _showProductDetail(BuildContext context, String productId) async {
    final token = await StorageService.getToken() ?? '';
    try {
      final detailResponse = await ProductService().getProductDetail(token, productId);
      final product = detailResponse.data?.first; // varsayım: tek ürün dönüyor
      if (product == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ürün detayı bulunamadı.')));
        return;
      }
      showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(product.description ?? ''),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(product.isActive == true ? Icons.check_circle : Icons.cancel),
                    label: Text(product.isActive == true ? 'Aktif' : 'Pasif'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: product.isActive == true ? Colors.green : Colors.red,
                    ),
                    onPressed: null,
                  ),
                  SizedBox(width: 12),
                  ElevatedButton.icon(
                    icon: Icon(product.isReserved == true ? Icons.lock : Icons.lock_open),
                    label: Text(product.isReserved == true ? 'Rezerve Edildi' : 'Rezerve Değil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: product.isReserved == true ? Colors.orange : Colors.blueGrey,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Detay yüklenemedi: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ürünlerim')),
      body: _productsFuture == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<AllProductResponse>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Hata: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.data == null || snapshot.data!.data!.isEmpty) {
                  return Center(child: Text('Hiç ürününüz yok.'));
                } else {
                  final products = snapshot.data!.data!;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: product.imagePath != null && product.imagePath!.isNotEmpty
                              ? Image.network(product.imagePath!, width: 56, height: 56, fit: BoxFit.cover)
                              : Icon(Icons.image_not_supported),
                          title: Text(product.name ?? ''),
                          subtitle: Text(product.description ?? ''),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('₺${product.discountedPrice}', style: TextStyle(fontWeight: FontWeight.bold)),
                              if (product.originalPrice != null && product.originalPrice != product.discountedPrice)
                                Text(
                                  '₺${product.originalPrice}',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                            ],
                          ),
                          onTap: () => _showProductDetail(context, product.id ?? ''),
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}
