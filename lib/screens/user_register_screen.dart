import 'package:flutter/material.dart';
import '../widgets/location.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  _UserRegisterScreenState createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  double? latitude;
  double? longitude;

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      prefixIcon: Icon(
        label == "Email"
            ? Icons.email_outlined
            : label.contains("Şifre")
                ? Icons.lock_outline
                : Icons.person_outline,
        color: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextField(controller: firstNameController, decoration: _inputDecoration('Adınız')),
              const SizedBox(height: 20),
              TextField(controller: lastNameController, decoration: _inputDecoration('Soyadınız')),
              const SizedBox(height: 20),
              TextField(controller: usernameController, decoration: _inputDecoration('Kullanıcı Adı')),
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
              TextField(controller: passwordController, obscureText: true, decoration: _inputDecoration('Şifre')),
              const SizedBox(height: 20),
              TextField(controller: confirmPasswordController, obscureText: true, decoration: _inputDecoration('Şifre Doğrulama')),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // kayıt işlemi
                },
                child: const Text('Kayıt Ol'),
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
