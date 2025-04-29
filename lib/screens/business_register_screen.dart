import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// OpenAPI-generated client & model
import 'package:tezgel_app/api/lib/src/serializers.dart';
import 'package:tezgel_app/api/lib/src/api/auth_api.dart';
import 'package:tezgel_app/api/lib/src/model/business_register_request.dart';

import '../widgets/location.dart';

class BusinessRegisterScreen extends StatefulWidget {
  const BusinessRegisterScreen({super.key});

  @override
  _BusinessRegisterScreenState createState() => _BusinessRegisterScreenState();
}

class _BusinessRegisterScreenState extends State<BusinessRegisterScreen> {
  final TextEditingController marketNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? companyType;
  double? latitude;
  double? longitude;
  bool _isLoading = false;

  final List<String> companyTypes = [
    'Anonim Şirket (A.Ş.)',
    'Limited Şirket (Ltd. Şti.)',
    'Şahıs Şirketi',
    'Komandit Şirket',
    'Kooperatif',
  ];

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      prefixIcon: Icon(
        label.contains("İşletme")
            ? Icons.storefront_outlined
            : label.contains("Şifre")
                ? Icons.lock_outline
                : label.contains("Email")
                    ? Icons.email_outlined
                    : Icons.person_outline,
        color: Colors.green,
      ),
    );
  }

  Future<void> _register() async {
    final authApi = Provider.of<AuthApi>(context, listen: false);

    // Basit validasyon
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Şifreler eşleşmiyor')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Oluşturulan built_value isteği
    final req = BusinessRegisterRequest((b) => b
      ..businessName = marketNameController.text
      ..companyType = companyType
      ..firstName = firstNameController.text
      ..lastName = lastNameController.text
      ..username = userNameController.text
      ..email = emailController.text
      ..password = passwordController.text
      ..latitude = latitude
      ..longitude = longitude
    );

    try {
      // Aşağıdaki metot adını kendi AuthApi içindeki business-register endpoint’ine göre düzeltin.
      await authApi.apiAuthCreateBusinessRegisterPost(
        businessRegisterRequest: req,
      );

      // Başarılıysa login sayfasına yönlendir
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt başarısız: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(controller: marketNameController, decoration: _inputDecoration('İşletme Adı')),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: companyType,
                hint: const Text('İşletme Tipi Seçiniz'),
                decoration: _inputDecoration('İşletme Tipi'),
                items: companyTypes
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (v) => setState(() => companyType = v),
              ),
              const SizedBox(height: 20),
              TextField(controller: firstNameController, decoration: _inputDecoration('Adınız')),
              const SizedBox(height: 20),
              TextField(controller: lastNameController, decoration: _inputDecoration('Soyadınız')),
              const SizedBox(height: 20),
              TextField(controller: userNameController, decoration: _inputDecoration('Kullanıcı Adı')),
              const SizedBox(height: 20),
              TextField(controller: emailController, decoration: _inputDecoration('Email')),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final result = await selectLocation(context);
                  if (result != null) {
                    setState(() {
                      latitude = result['latitude'];
                      longitude = result['longitude'];
                    });
                  }
                },
                child: const Text('Konum Seç'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                latitude != null && longitude != null
                    ? 'Lat: $latitude, Lng: $longitude'
                    : 'Henüz konum seçilmedi.',
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: _inputDecoration('Şifre'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: _inputDecoration('Şifre Doğrulama'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isLoading ? null : _register,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Kayıt Ol'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
