import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezgel_app/screens/customer_service.dart';
import 'package:tezgel_app/screens/my_products_screen.dart';
import 'package:tezgel_app/screens/product_add_screen.dart';
import 'package:tezgel_app/services/user_info_services.dart';
import 'package:intl/intl.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  dynamic userData;
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
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kullanıcı bilgileri alınamadı')),
        );
      }
    } else {
      setState(() => isLoading = false);
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
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.orange,
                        child: Text(
                          (userData?.firstName ?? 'K')[0].toUpperCase(),
                          style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${userData?.firstName ?? ''} ${userData?.lastName ?? ''}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      
                      const SizedBox(height: 32),
                      _buildProfileInfoCard(context),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
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
    if (userData == null) return const SizedBox.shrink();

    final Map<String, dynamic> infoMap = userData.toJson();
    final fieldLabels = {
      'firstName': 'Ad',
      'lastName': 'Soyad',
      'email': 'Email',
      'companyName': 'İşletme',
      'companyType': 'İşletme Türü',
      'closingTime': 'Kapanış Saati',
      'address': 'Adres',
      'birthDate': 'Doğum Tarihi',
    };

    final iconMap = {
      'firstName': Icons.person,
      'lastName': Icons.person,
      'email': Icons.email,
      'companyName': Icons.business,
      'companyType': Icons.category,
      'closingTime': Icons.access_time,
      'address': Icons.location_on,
      'birthDate': Icons.cake,
    };

    final validFields = fieldLabels.keys.where((key) =>
        infoMap[key] != null && infoMap[key].toString().trim().isNotEmpty);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: const Color(0xFFFFF0E8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final key in validFields) ...[
              _buildInfoRow(
                iconMap[key] ?? Icons.info,
                fieldLabels[key] ?? key,
                key == 'birthDate'
                    ? _formatDate(infoMap[key].toString())
                    : infoMap[key].toString(),
              ),
              const SizedBox(height: 16),
            ],
            _buildActionButton(Icons.headset_mic, 'Müşteri Hizmetleri', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CustomerServiceScreen()),
              );
            }),
            const SizedBox(height: 16),
            if (role == 'Business') ...[
              _buildActionButton(Icons.add_box, 'Ürün Ekle', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductAddScreen()),
                );
              }),
              const SizedBox(height: 16),
              _buildActionButton(Icons.list, 'Ürünlerim', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MyProductsScreen()),
                );
              }),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return DateFormat('dd.MM.yyyy').format(date);
    } catch (e) {
      return isoDate;
    }
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
              Text(value, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
      IconData icon, String title, VoidCallback onPressed) {
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
      label: Text(title, style: const TextStyle(fontSize: 18)),
    );
  }
}
