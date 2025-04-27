import 'package:flutter/material.dart';
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

  final List<String> companyTypes = [
    'Anonim Şirket (A.Ş.)',
    'Limited Şirket (Ltd. Şti.)',
    'Şahıs Şirketi',
    'Komandit Şirket',
    'Kooperatif',
  ];

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('İşletme Adı', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: marketNameController, decoration: _inputDecoration('Market Adı')),
              const SizedBox(height: 10),
              const Text('İşletme Tipi', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: companyType,
                hint: const Text('İşletme Tipi Seçiniz'),
                items: companyTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                onChanged: (value) {
                  setState(() {
                    companyType = value;
                  });
                },
                decoration: _inputDecoration('İşletme Tipi'),
              ),
              const SizedBox(height: 10),
              const Text('Adınız', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: firstNameController, decoration: _inputDecoration('Adınız')),
              const SizedBox(height: 10),
              const Text('Soyadınız', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: lastNameController, decoration: _inputDecoration('Soyadınız')),
              const SizedBox(height: 10),
              const Text('Kullanıcı Adı', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: userNameController, decoration: _inputDecoration('Kullanıcı Adı')),
              const SizedBox(height: 10),
              const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: emailController, decoration: _inputDecoration('Email')),
              const SizedBox(height: 10),
              const Text('Konum', style: TextStyle(fontWeight: FontWeight.bold)),
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
              ),
              const SizedBox(height: 5),
              Text(
                latitude != null && longitude != null
                    ? 'Lat: $latitude, Lng: $longitude'
                    : 'Henüz konum seçilmedi.',
              ),
              const SizedBox(height: 10),
              const Text('Şifre', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: passwordController, obscureText: true, decoration: _inputDecoration('Şifre')),
              const SizedBox(height: 10),
              const Text('Şifre Doğrulama', style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: confirmPasswordController, obscureText: true, decoration: _inputDecoration('Şifre Doğrulama')),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Burada latitude ve longitude ile backend'e gönderebilirsin
                },
                child: const Text('Kayıt Ol'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
