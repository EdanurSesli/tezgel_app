import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the provider instance
    final languageProvider = Provider.of<LanguageProvider>(context);

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
        // Priority to provider's locale
        if (supportedLocales.contains(languageProvider.currentLocale)) {
          return languageProvider.currentLocale;
        }
        
        // Fallback to device locale
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