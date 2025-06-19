import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezgel_app/screens/my_account_screen.dart';
import 'package:tezgel_app/screens/reservation_list_screen.dart';
import 'package:tezgel_app/screens/reservation_screen.dart';
import '../widgets/bottom_navbar.dart';
import 'home_screen.dart';
import 'categories_screen.dart';
import 'notifications_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String? _role;

  @override
  void initState() {
    super.initState();
    _fetchRole();
  }

  Future<void> _fetchRole() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _role = prefs.getString('role');
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ortadaki butona basınca ReservationListScreen(role: _role) göster
    final screens = [
      const HomeScreen(),
      const CategoriesScreen(),
      ReservationListScreen(role: _role), // Dinamik role ile
      const NotificationsScreen(),
      const MyAccountScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
