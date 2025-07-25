import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezgel_app/screens/customer_service.dart';
import 'package:tezgel_app/screens/my_products_screen.dart';
import 'package:tezgel_app/screens/product_add_screen.dart';
import 'package:tezgel_app/services/user_info_services.dart';
import 'package:intl/intl.dart';
import 'package:tezgel_app/services/business_service.dart';
import 'package:tezgel_app/services/customer_services.dart';
import 'package:tezgel_app/screens/reservation_list_screen.dart';

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

  Future<void> _showReservations() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ReservationListScreen(role: role),
      ),
    );
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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: isLoading || userData == null
                ? null
                : () => _showEditProfileSheet(context),
          ),
        ],
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
            _buildActionButton(Icons.calendar_today, 'Rezervasyonlarım', _showReservations),
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

  void _showEditProfileSheet(BuildContext context) {
    final infoMap = userData.toJson();
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

    final editableFields = [
      'firstName',
      'lastName',
      'email',
      'companyName',
      'companyType',
      'closingTime',
      'address',
      'birthDate',
    ];

    final controllers = <String, TextEditingController>{};
    for (final key in editableFields) {
      controllers[key] = TextEditingController(text: infoMap[key]?.toString() ?? '');
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              bool updating = false;
              String? errorMsg;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Bilgilerini Düzenle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...editableFields.map((key) {
                    // Sadece mevcut olan alanları göster
                    if (!infoMap.containsKey(key)) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        controller: controllers[key],
                        decoration: InputDecoration(
                          labelText: fieldLabels[key] ?? key,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: key == 'email'
                            ? TextInputType.emailAddress
                            : TextInputType.text,
                        readOnly: key == 'email', // Email değiştirilemez
                        onTap: key == 'birthDate'
                            ? () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: controllers[key]!.text.isNotEmpty
                                      ? DateTime.tryParse(controllers[key]!.text) ?? DateTime.now()
                                      : DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (picked != null) {
                                  controllers[key]!.text = picked.toIso8601String();
                                  setModalState(() {});
                                }
                              }
                            : null,
                      ),
                    );
                  }),
                  if (errorMsg != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(errorMsg!, style: const TextStyle(color: Colors.red)),
                    ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: updating
                          ? null
                          : () async {
                              setModalState(() {
                                updating = true;
                                errorMsg = null;
                              });
                              try {
                                final prefs = await SharedPreferences.getInstance();
                                final token = prefs.getString('accessToken');
                                if (token == null) throw Exception('Token bulunamadı');
                                final updateData = <String, dynamic>{};
                                for (final key in editableFields) {
                                  if (controllers[key] != null) {
                                    updateData[key] = controllers[key]!.text;
                                  }
                                }
                                // Doğum tarihi formatı düzelt
                                if (updateData['birthDate'] != null && updateData['birthDate'].toString().isNotEmpty) {
                                  try {
                                    final dt = DateTime.parse(updateData['birthDate']);
                                    updateData['birthDate'] = dt.toIso8601String();
                                  } catch (_) {}
                                }
                                dynamic updatedResponse;
                                if (role?.toLowerCase() == 'business') {
                                  updatedResponse = await updateBusinessProfile(token, updateData);
                                } else if (role?.toLowerCase() == 'customer') {
                                  updatedResponse = await updateCustomerProfile(token, updateData);
                                }
                                // Güncel verileri tekrar çek
                                await _fetchUserInfo();
                                Navigator.of(ctx).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Bilgiler başarıyla güncellendi')),
                                );
                              } catch (e) {
                                setModalState(() {
                                  errorMsg = 'Güncelleme başarısız: ${e.toString()}';
                                  updating = false;
                                });
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: updating
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('Güncelle', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
