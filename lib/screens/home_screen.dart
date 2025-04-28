import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Color borderColor = const Color(0xFFD7D7E0); // Tema çerçeve rengi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            // LOGO
            const Text(
              'LOGO',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Search Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSearchButton(Icons.search, 'Text'),
                  _buildSearchButton(Icons.category, 'Category'),
                  _buildSearchButton(Icons.location_on, 'Location'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              color: borderColor,
              thickness: 2,
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 8),
            // Product Card
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildProductCard(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
      ),
    );
  }

  Widget _buildSearchButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.green),
      label: Text(label, style: const TextStyle(color: Colors.green)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildProductCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ürün resmi
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://img.freepik.com/premium-photo/lots-loaves-bread-shelves-bakery-store_902845-16371.jpg',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            // Ürün adı
            const Text(
              'Ekmek',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Lokasyon
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: borderColor),
                const SizedBox(width: 4),
                const Text('Bakırköy/İstanbul', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            // Kategori
            Row(
              children: [
                Icon(Icons.category, size: 16, color: borderColor),
                const SizedBox(width: 4),
                const Text('Unlu Mamüller', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            // Zaman
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: borderColor),
                const SizedBox(width: 4),
                const Text('1 hours ago', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            // İşletme adı
            Row(
              children: [
                Icon(Icons.apartment, size: 16, color: borderColor),
                const SizedBox(width: 4),
                const Text('Kardeşler Fırın', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 12),
            // Fiyat bilgileri
            Row(
              children: [
                Text(
                  '₺30.00',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '₺20.00',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Açıklama
            const Text(
              "We are looking for an experienced mobile app developer to create a cutting-edge iOS and Android applications for our startup.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            // View Details butonu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('View Details', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
