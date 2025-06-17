// favorites_screen.dart
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Baklagiller',
      'icon': Icons.rice_bowl,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'Sebzeler',
      'icon': Icons.eco,
      'color': Colors.green,
    },
    {
      'title': 'Meyveler',
      'icon': Icons.apple,
      'color': Colors.redAccent,
    },
    {
      'title': 'Süt Ürünleri',
      'icon': Icons.local_drink,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Et & Tavuk',
      'icon': Icons.set_meal,
      'color': Colors.brown,
    },
    {
      'title': 'Unlu Mamuller',
      'icon': Icons.bakery_dining,
      'color': Colors.amber,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriler'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              color: category['color'].withOpacity(0.15),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  // Kategoriye tıklanınca yapılacaklar
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: category['color'],
                      radius: 28,
                      child: Icon(
                        category['icon'],
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      category['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
