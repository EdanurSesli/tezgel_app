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
import 'package:tezgel_app/services/user_info_services.dart';
import 'package:tezgel_app/models/business_profile/business_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  BusinessData? userData;
  String? role;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    final userRole = prefs.getString('role');
    if (token != null && userRole != null) {
      try {
        final response = await getUserProfile(token, userRole);
        setState(() {
          userData = response.data;
          role = userRole;
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        // Hata göster
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kullanıcı bilgileri alınamadı')),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      // Profil Fotoğrafı (Adının ilk harfi)
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.orange,
                        child: Text(
                          (userData?.firstName != null && userData!.firstName!.isNotEmpty)
                              ? userData!.firstName![0].toUpperCase()
                              : 'K',
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Kullanıcı Adı
                      Text(
                        userData != null
                            ? '${userData!.firstName ?? ''} ${userData!.lastName ?? ''}'
                            : 'Kullanıcı',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Email
                      Text(
                        userData?.email ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildProfileInfoCard(context),
                      const SizedBox(height: 32),
                      // Çıkış Butonu
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear(); // Tüm pref'leri sil
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
    if (userData == null) {
      return const SizedBox.shrink();
    }
    if (role == 'business') {
      // Tüm business alanlarını sırayla göster
      final businessMap = userData!.toJson();
      final fieldLabels = {
        'firstName': 'Ad',
        'lastName': 'Soyad',
        'email': 'Email',
        'companyName': 'İşletme',
        'companyType': 'İşletme Türü',
        'closingTime': 'Kapanış Saati',
      };
      final iconMap = {
        'firstName': Icons.person,
        'lastName': Icons.person,
        'email': Icons.email,
        'companyName': Icons.business,
        'companyType': Icons.category,
        'closingTime': Icons.access_time,
      };

      // Sadece label'ı olan ve değeri boş olmayan alanları sırayla göster
      final fields = [
        'firstName',
        'lastName',
        'email',
        'companyName',
        'companyType',
        'closingTime',
      ].where((key) =>
          businessMap[key] != null &&
          businessMap[key].toString().trim().isNotEmpty).toList();

      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < fields.length; i++) ...[
                if (i != 0) const SizedBox(height: 16),
                _buildInfoRow(
                  iconMap[fields[i]] ?? Icons.info,
                  fieldLabels[fields[i]] ?? fields[i],
                  businessMap[fields[i]].toString(),
                ),
              ],
              const SizedBox(height: 16),
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

    // Customer ise mevcut yapı devam etsin
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userData?.firstName != null)
              _buildInfoRow(Icons.person, 'Ad Soyad',
                  '${userData!.firstName ?? ''} ${userData!.lastName ?? ''}'),
            if (userData?.email != null) ...[
              const SizedBox(height: 16),
              _buildInfoRow(Icons.email, 'Email', userData!.email ?? ''),
            ],
            const SizedBox(height: 16),
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
