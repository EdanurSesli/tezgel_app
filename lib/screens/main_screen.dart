import 'package:flutter/material.dart';
import 'package:tezgel_app/screens/my_account_screen.dart';
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

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    SizedBox(), // Action button placeholder
    NotificationsScreen(),
    MyAccountScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != 2) { // Orta buton hariç
      setState(() {
        _selectedIndex = index;
      });
    } else {
      // Floating action button tıklandığında yapılacak işlem buraya yazılır.
    }
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
