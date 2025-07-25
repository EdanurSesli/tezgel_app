import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tezgel_app/services/product_services.dart';
import 'package:tezgel_app/models/product_models/product_request.dart';
import 'package:tezgel_app/services/storage_service.dart';
import 'package:tezgel_app/services/category_services.dart';
import 'package:tezgel_app/models/category/category_response.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _originalPriceController = TextEditingController();
  final TextEditingController _discountedPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController(); // Yeni eklendi
  String? categoryName;

  List<CategoryData> categories = [];
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _originalPriceController.dispose();
    _discountedPriceController.dispose();
    _imageUrlController.dispose(); // Yeni eklendi
    super.dispose();
  }

  Future<void> _fetchCategories() async {
    try {
      final res = await CategoryService().getCategories();
      setState(() {
        categories = res.data ?? [];
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = "Kategoriler yüklenemedi";
        loading = false;
      });
    }
  }

  Future<void> _createProduct() async {
    if (!_formKey.currentState!.validate()) return;

    if (_imageUrlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen bir resim URL\'si girin'), backgroundColor: Colors.red),
      );
      return;
    }

    try {
      final token = await StorageService.getToken();
      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Oturum bulunamadı')),
        );
        return;
      }

      final selectedCategory = categories.firstWhere(
        (cat) => cat.name == categoryName,
        orElse: () => CategoryData(),
      );

      final request = ProductRequest(
        name: _nameController.text,
        description: _descriptionController.text,
        categoryId: selectedCategory.id?.toString() ?? '',
        imagePath: _imageUrlController.text, // URL doğrudan kullanılıyor
        originalPrice: double.tryParse(_originalPriceController.text) ?? 0,
        discountedPrice: double.tryParse(_discountedPriceController.text) ?? 0,
      );

      final response = await ProductService().createProduct(token, request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/homescreen', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ürün eklenirken hata oluştu'), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata: \$e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Ekle'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Icon(Icons.add_box_rounded, color: Colors.green, size: 48),
                              const SizedBox(height: 8),
                              const Text(
                                'Yeni Ürün Ekle',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Satışa sunmak istediğiniz ürün bilgilerini giriniz.',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Ürün Adı',
                                      prefixIcon: Icon(Icons.shopping_bag_outlined, color: Colors.green[700]),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    validator: (v) => v == null || v.isEmpty ? 'Zorunlu' : null,
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _descriptionController,
                                    decoration: InputDecoration(
                                      labelText: 'Açıklama',
                                      prefixIcon: Icon(Icons.description_outlined, color: Colors.green[700]),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    maxLines: 2,
                                    validator: (v) => v == null || v.isEmpty ? 'Zorunlu' : null,
                                  ),
                                  const SizedBox(height: 16),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      labelText: 'Kategori',
                                      prefixIcon: Icon(Icons.category_outlined, color: Colors.green[700]),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    value: categoryName,
                                    items: categories
                                        .map((cat) => DropdownMenuItem(
                                              value: cat.name,
                                              child: Text(cat.name ?? ''),
                                            ))
                                        .toList(),
                                    onChanged: (val) => setState(() => categoryName = val),
                                    validator: (v) => v == null || v.isEmpty ? 'Zorunlu' : null,
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _imageUrlController,
                                    decoration: InputDecoration(
                                      labelText: 'Resim URL\'si',
                                      prefixIcon: Icon(Icons.link, color: Colors.green[700]),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    validator: (v) => v == null || v.isEmpty ? 'Zorunlu' : null,
                                  ),
                                  const SizedBox(height: 16),
                                  _imageUrlController.text.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            _imageUrlController.text,
                                            height: 150,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) => const Center(child: Text('Geçersiz URL')),
                                          ),
                                        )
                                      : Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Center(
                                            child: Text('Resim önizlemesi'),
                                          ),
                                        ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _originalPriceController,
                                          decoration: InputDecoration(
                                            labelText: 'Orijinal Fiyat',
                                            prefixIcon: Icon(Icons.price_change_outlined, color: Colors.green[700]),
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (v) => v == null || v.isEmpty ? 'Zorunlu' : null,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _discountedPriceController,
                                          decoration: InputDecoration(
                                            labelText: 'İndirimli Fiyat',
                                            prefixIcon: Icon(Icons.local_offer_outlined, color: Colors.orange[700]),
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (v) => v == null || v.isEmpty ? 'Zorunlu' : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 28),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      onPressed: _createProduct,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        minimumSize: const Size(double.infinity, 50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                                      label: const Text('Ürünü Ekle', style: TextStyle(fontSize: 18, color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
