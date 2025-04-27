import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tezgel_app/screens/login_screen.dart'; // Login ekranı
// import 'package:tezgel_app/screens/home_screen.dart'; // İstersen login başarılıysa gidilecek ekran

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      checkLoginStatus();
    });
  }

  void checkLoginStatus() async {
    // Burada local storage veya herhangi bir yerden kullanıcı login kontrolü yapılacak.
    bool isLoggedIn = false; // Şu anda manuel false verdik, sonra buraya gerçek kontrol eklersin.

    if (isLoggedIn) {
      // Kullanıcı giriş yapmışsa ana ekrana yönlendir
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      // Giriş yapmamışsa login ekranına yönlendir
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'TezGel',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
