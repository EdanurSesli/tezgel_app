import 'package:flutter/material.dart';
import '../screens/my_account_screen.dart'; // MyAccountScreen'i import ettik

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  void _handleTap(BuildContext context, int index) {
    if (index == 3) { // 3 = Account ikonunun olduğu index
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAccountScreen()),
      );
    } else {
      onItemTapped(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _handleTap(context, index),
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 8,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
    );
  }
}
