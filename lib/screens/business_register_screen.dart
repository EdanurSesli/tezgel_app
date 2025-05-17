import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/business_register/business_register_bloc.dart';
import '../blocs/business_register/business_register_event.dart';
import '../blocs/business_register/business_register_state.dart';
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
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? companyType;
  double? latitude;
  double? longitude;
  TimeOfDay? closingTime;

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BusinessRegisterBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('İşletme Adı',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(
                    controller: marketNameController,
                    decoration: _inputDecoration('İşletme Adı')),
                const SizedBox(height: 20),
                const Text('İşletme Tipi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: companyType,
                  hint: const Text('İşletme Tipi Seçiniz'),
                  items: companyTypes
                      .map((type) =>
                          DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      companyType = value;
                    });
                  },
                  decoration: _inputDecoration('İşletme Tipi'),
                ),
                const SizedBox(height: 20),
                TextField(
                    controller: firstNameController,
                    decoration: _inputDecoration('Adınız')),
                const SizedBox(height: 20),
                TextField(
                    controller: lastNameController,
                    decoration: _inputDecoration('Soyadınız')),
                const SizedBox(height: 20),
                TextField(
                    controller: userNameController,
                    decoration: _inputDecoration('Kullanıcı Adı')),
                const SizedBox(height: 20),
                TextField(
                    controller: emailController,
                    decoration: _inputDecoration('Email')),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
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
                const Text('Kapanış Saati',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: closingTime ?? TimeOfDay(hour: 17, minute: 0),
                    );
                    if (picked != null) {
                      setState(() {
                        closingTime = picked;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    closingTime != null
                        ? 'Seçilen Kapanış Saati: ${closingTime!.format(context)}'
                        : 'Kapanış Saatini Seç',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: _inputDecoration('Şifre')),
                const SizedBox(height: 20),
                TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: _inputDecoration('Şifre Doğrulama')),
                const SizedBox(height: 30),
                BlocConsumer<BusinessRegisterBloc, BusinessRegisterState>(
                  listener: (context, state) {
                    if (state is BusinessRegisterSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Kayıt Başarılı!')),
                      );
                      Navigator.pop(context);
                    } else if (state is BusinessRegisterFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is BusinessRegisterLoading
                          ? null
                          : () {
                              if (passwordController.text != confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Şifreler eşleşmiyor")),
                                );
                                return;
                              }
                              if (companyType == null || latitude == null || longitude == null || closingTime == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Lütfen tüm alanları doldurun")),
                                );
                                return;
                              }

                              final closingTimeStr =
                                  '${closingTime!.hour.toString().padLeft(2, '0')}:${closingTime!.minute.toString().padLeft(2, '0')}';

                              context.read<BusinessRegisterBloc>().add(
                                    BusinessRegisterSubmitted(
                                      marketName: marketNameController.text,
                                      companyType: companyType!,
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      username: userNameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      latitude: latitude!,
                                      longitude: longitude!,
                                      closingTime: closingTimeStr,
                                    ),
                                  );
                            },
                      child: state is BusinessRegisterLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Kayıt Ol'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
