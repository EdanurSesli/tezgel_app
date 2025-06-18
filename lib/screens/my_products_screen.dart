import 'package:flutter/material.dart';
import '../services/product_services.dart';
import '../models/product_models/product_model.dart';
import '../services/storage_service.dart';

class MyProductsScreen extends StatefulWidget {
  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  Future<ProductResponse>? _productsFuture;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ürünlerim')),
      body: _productsFuture == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<ProductResponse>(
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
