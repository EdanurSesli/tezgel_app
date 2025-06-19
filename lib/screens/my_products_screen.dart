import 'package:flutter/material.dart';
import 'package:tezgel_app/models/product_models/all_product_response.dart';
import 'package:tezgel_app/models/product_models/product_repeat_model.dart';
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
      final product = detailResponse.data?.first;
      if (product == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ürün detayı bulunamadı.')));
        return;
      }
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent, // <-- Eklendi, arka planı şeffaf yapar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                color: const Color.fromARGB(255, 226, 192, 141), // <-- Eklendi, kartın arka planını da şeffaf yapar
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.imagePath != null && product.imagePath!.isNotEmpty)
                        Center(
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              product.imagePath!,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product.name ?? '',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₺${product.discountedPrice}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              if (product.originalPrice != null && product.originalPrice != product.discountedPrice)
                                Text(
                                  '₺${product.originalPrice}',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Card(
                        color: Colors.grey.shade50,
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            product.description ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: product.isActive == true
                                  ? () async {
                                      // Sadece aktifken pasife çekilebilir
                                      final shouldToggle = await showDialog<bool>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Durum Değiştir'),
                                            content: Text('Bu ürünü pasif yapmak istediğinizden emin misiniz?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('İptal'),
                                                onPressed: () => Navigator.of(context).pop(false),
                                              ),
                                              TextButton(
                                                child: Text('Onayla'),
                                                onPressed: () => Navigator.of(context).pop(true),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (shouldToggle == true) {
                                        try {
                                          final token = await StorageService.getToken() ?? '';
                                          await ProductService().isActiveProduct(token, product.id ?? '');
                                          Navigator.pop(context); // Close detail modal
                                          _loadProducts(); // Refresh product list
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Ürün durumu başarıyla güncellendi')),
                                          );
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Durum güncellenirken hata oluştu: $e')),
                                          );
                                        }
                                      }
                                    }
                                  : null, // Pasifken tıklanamaz
                              child: Card(
                                elevation: 0,
                                color: product.isActive == true
                                    ? Colors.green.shade50
                                    : Colors.grey.shade200,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        product.isActive == true ? Icons.check_circle : Icons.cancel,
                                        color: product.isActive == true ? Colors.green : Colors.grey,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        product.isActive == true ? 'Aktif' : 'Pasif',
                                        style: TextStyle(
                                          color: product.isActive == true ? Colors.green : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Card(
                              elevation: 0,
                              color: product.isReserved == true ? Colors.orange.shade50 : Colors.blueGrey.shade50,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      product.isReserved == true ? Icons.lock : Icons.lock_open,
                                      color: product.isReserved == true ? Colors.orange : Colors.blueGrey,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      product.isReserved == true ? 'Rezerve' : 'Müsait',
                                      style: TextStyle(
                                        color: product.isReserved == true ? Colors.orange : Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.refresh, color: Colors.white),
                            label: Text('Yeniden Aktif Et'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: product.isActive == false ? Colors.green : Colors.grey,
                              foregroundColor: Colors.white,
                              minimumSize: Size(180, 48),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: product.isActive == false
                                ? () async {
                                    final originalPriceController = TextEditingController(
                                      text: product.originalPrice?.toString() ?? '',
                                    );
                                    final discountedPriceController = TextEditingController(
                                      text: product.discountedPrice?.toString() ?? '',
                                    );
                                    final result = await showDialog<Map<String, int>>(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Fiyatları Girin'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: originalPriceController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(labelText: 'Eski Fiyat (₺)'),
                                              ),
                                              TextField(
                                                controller: discountedPriceController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(labelText: 'Yeni Fiyat (₺)'),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text('İptal'),
                                              onPressed: () => Navigator.of(context).pop(),
                                            ),
                                            TextButton(
                                              child: Text('Kaydet'),
                                              onPressed: () {
                                                final original = int.tryParse(originalPriceController.text);
                                                final discounted = int.tryParse(discountedPriceController.text);
                                                if (original != null && discounted != null) {
                                                  Navigator.of(context).pop({
                                                    'originalPrice': original,
                                                    'discountedPrice': discounted,
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (result != null && result['originalPrice'] != null && result['discountedPrice'] != null) {
                                      try {
                                        final token = await StorageService.getToken() ?? '';
                                        await ProductService().repeatProduct(
                                          token,
                                          product.id ?? '',
                                          ProductRepeatModel(
                                            productId: product.id,
                                            originalPrice: result['originalPrice'],
                                            discountedPrice: result['discountedPrice'],
                                          ),
                                        );
                                        Navigator.pop(context); // Close detail modal
                                        _loadProducts(); // Refresh product list
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Ürün yeniden aktif edildi')),
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Yeniden aktif edilirken hata oluştu: $e')),
                                        );
                                      }
                                    }
                                  }
                                : null, // Aktifken tıklanamaz
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Center(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () async {
                            final shouldDelete = await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Ürünü Sil'),
                                  content: Text('Bu ürünü silmek istediğinizden emin misiniz?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('İptal'),
                                      onPressed: () => Navigator.of(context).pop(false),
                                    ),
                                    TextButton(
                                      child: Text('Onayla', style: TextStyle(color: Colors.red)),
                                      onPressed: () => Navigator.of(context).pop(true),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (shouldDelete == true) {
                              try {
                                final token = await StorageService.getToken() ?? '';
                                await ProductService().deleteProduct(token, product.id ?? '');
                                Navigator.pop(context); // Close detail modal
                                _loadProducts(); // Refresh product list
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Ürün başarıyla silindi')),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Ürün silinirken hata oluştu: $e')),
                                );
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(14),
                            child: Icon(
                              Icons.delete_forever_rounded,
                              color: Colors.red.shade700,
                              size: 34,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
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
