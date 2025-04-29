import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

// OpenAPI-generated client & Dio
import 'package:dio/dio.dart';
import 'package:tezgel_app/api/lib/src/api/auth_api.dart';
import 'package:tezgel_app/api/lib/src/serializers.dart';

import 'package:tezgel_app/providers/language_provider.dart';
import 'package:tezgel_app/screens/business_register_screen.dart';
import 'package:tezgel_app/screens/home_screen.dart';
import 'package:tezgel_app/screens/register_screen.dart';
import 'package:tezgel_app/screens/splash_screen.dart';
import 'package:tezgel_app/screens/user_register_screen.dart';
import 'package:tezgel_app/screens/login_screen.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1) Dio init
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.sizin-sunucu.com',  // ← kendi API kök URL’iniz
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  // dio.interceptors.add(AuthInterceptor());  // eğer auth gerekiyorsa interceptor ekleyin

  // 2) OpenAPI DefaultApi örneği
  final authApi = AuthApi(dio, serializers);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        Provider<AuthApi>.value(value: authApi),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Language provider
    final languageProvider = Provider.of<LanguageProvider>(context);
    // API client erişmek istediğiniz yerde:
    // final api = Provider.of<DefaultApi>(context);

    return MaterialApp(
      locale: languageProvider.currentLocale,
      onGenerateTitle: (context) => S.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(languageProvider.currentLocale)) {
          return languageProvider.currentLocale;
        }
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
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
