import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tezgel_app/providers/language_provider.dart';
import 'package:tezgel_app/screens/business_register_screen.dart';
import 'package:tezgel_app/screens/favorites_screen.dart';
import 'package:tezgel_app/screens/home_screen.dart';
import 'package:tezgel_app/screens/my_account_screen.dart';
import 'package:tezgel_app/screens/notifications_screen.dart';
import 'package:tezgel_app/screens/register_screen.dart';
import 'package:tezgel_app/screens/splash_screen.dart';
import 'package:tezgel_app/screens/user_register_screen.dart';
import 'package:tezgel_app/screens/login_screen.dart';
import 'package:tezgel_app/widgets/bottom_navbar.dart';
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
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: 'TezGel',
      locale: languageProvider.currentLocale,
      onGenerateTitle: (context) => S.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
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
        '/businessregister': (context) => const BusinessRegisterScreen(),
        '/userregister': (context) => const UserRegisterScreen(),
        '/register': (context) => const RegisterSelectionScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Ekran Listesi
  final List<Widget> _screens = const [
    HomeScreen(),
    FavoritesScreen(),
    SizedBox.shrink(), // Ortada aksiyon butonu olacak boş alan
    NotificationsScreen(),
    MyAccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
