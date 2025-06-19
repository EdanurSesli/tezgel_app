import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    const double fabHeight = 56.0 + 16.0;
    const double bottomNavBarHeight = kBottomNavigationBarHeight;
    final double positionBottom = bottomNavBarHeight - (fabHeight / 2);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconSize: 24, // Sabit ikon boyutu
          selectedLabelStyle: const TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.normal // Yazı stilini sabit tut
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal // Yazı stilini sabit tut
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home, color: Colors.grey),
              activeIcon: Icon(FeatherIcons.home, color: Colors.green),
              label: 'Anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.grid, color: Colors.grey),
              activeIcon: Icon(FeatherIcons.grid, color: Colors.green),
              label: 'Kategoriler',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bell, color: Colors.grey),
              activeIcon: Icon(FeatherIcons.bell, color: Colors.green),
              label: 'Bildirimler',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user, color: Colors.grey),
              activeIcon: Icon(FeatherIcons.user, color: Colors.green),
              label: 'Hesabım',
            ),
          ],
        ),
        Positioned(
          bottom: positionBottom,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: fabHeight,
              width: fabHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: () {
                  // Ortadaki şimşek ikonuna basınca 2. indexi tetikle
                  onItemTapped(2);
                },
                backgroundColor: Colors.green,
                elevation: 0,
                child: const Icon(
                  FeatherIcons.zap, 
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}