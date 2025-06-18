import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezgel_app/screens/customer_service.dart'; // Cupertino (iOS) navigasyonu için
import 'package:tezgel_app/services/product_services.dart';
import 'package:tezgel_app/models/product_models/product_request.dart';
import 'package:tezgel_app/services/storage_service.dart';
import 'package:tezgel_app/models/register_models/base_register_response.dart';
import 'package:tezgel_app/services/category_services.dart';
import 'package:tezgel_app/models/category/category_response.dart';
import 'package:tezgel_app/screens/product_add_screen.dart';
import 'my_products_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hesabım'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Profil Fotoğrafı
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=2', // Örnek profil fotoğrafı
                  ),
                ),
                
                const SizedBox(height: 16),

                // Kullanıcı Adı
                const Text(
                  'Edanur Sesli',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Email
                const Text(
                  'edanursesli@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 32),

                // Profil Bilgiler Kartı
                _buildProfileInfoCard(context),

                const SizedBox(height: 32),

                // Çıkış Butonu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Çıkış işlemi burada yapılacak ve login sayfasına yönlendirilecek
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.logout),
                    label: const Text(
                      'Çıkış Yap',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(Icons.phone, 'Telefon', '+90 501 201 38 44'),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.location_on, 'Konum', 'Bakırköy, İstanbul'),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.business, 'İşletme', 'Kardeşler Fırın'),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.comment, 'Yorumlar', 'Ürün ve Satıcı Yorumlarım'),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.add_shopping_cart, 'Ürünlerim', 'Ekmek, Pasta, Çörek vb.'),
            const SizedBox(height: 16),

            // Müşteri Hizmetleri ve Ürün Ekle Butonları
            _buildActionButton(Icons.headset_mic, 'Müşteri Hizmetleri', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomerServiceScreen()),
              );
            }),
            const SizedBox(height: 16),
            _buildActionButton(Icons.add_box, 'Ürün Ekle', () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductAddScreen()),
              );
            }),
            const SizedBox(height: 16),
            _buildActionButton(Icons.list, 'Ürünlerim', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProductsScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String title, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
