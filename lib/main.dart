import 'package:flutter/material.dart';
import 'package:tezgel_app/screens/business_register_screen.dart';
import 'package:tezgel_app/screens/home_screen.dart';
import 'package:tezgel_app/screens/register_screen.dart';
import 'package:tezgel_app/screens/splash_screen.dart';
import 'package:tezgel_app/screens/user_register_screen.dart';

import 'screens/login_screen.dart'; // SplashScreen dosyan

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Google Maps veya diğer async işlemler için gerekli
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TezGel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterSelectionScreen(),
        '/businessregister': (context) => const BusinessRegisterScreen(),
        '/userregister': (context) => const UserRegisterScreen(),
      },
    );
  }
}
