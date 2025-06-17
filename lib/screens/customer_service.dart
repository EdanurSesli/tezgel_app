import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  final List<Map<String, String>> faqList = const [
    {
      'question': 'Nasıl sipariş verebilirim?',
      'answer': 'Ana sayfada ürünleri görüntüleyebilir ve sepete ekleyerek sipariş verebilirsiniz.'
    },
    {
      'question': 'Ödeme seçenekleri nelerdir?',
      'answer': 'Kredi kartı ve kapıda ödeme seçeneklerimiz mevcuttur. Online ödemelerde 3D Secure kullanılmaktadır.'
    },
    {
      'question': 'İade ve değişim politikanız nedir?',
      'answer': 'Ürünleri teslim aldıktan sonra 24 saat içinde iade edebilirsiniz. İade için müşteri hizmetleriyle iletişime geçmeniz gerekmektedir.'
    },
    {
      'question': 'Teslimat süresi ne kadar?',
      'answer': 'Siparişleriniz bulunduğunuz konuma göre 30 dakika ile 2 saat arasında teslim edilmektedir.'
    },
    {
      'question': 'Minimum sipariş tutarı var mı?',
      'answer': 'Minimum sipariş tutarımız 50₺\'dir.'
    },
    {
      'question': 'Ürünler taze mi?',
      'answer': 'Tüm ürünlerimiz günlük olarak hazırlanmakta ve tazeliği garanti edilmektedir.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text('Müşteri Hizmetleri'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sık Sorulan Sorular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: faqList.map((faq) => _buildFAQButton(context, faq)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'İletişim Bilgileri',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildContactTile(Icons.phone, 'Telefon', '0850 123 45 67'),
                    _buildContactTile(Icons.email, 'E-posta', 'destek@tezgel.com'),
                    _buildContactTile(Icons.location_on, 'Adres', 'İstanbul, Türkiye'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Bize Ulaşın'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQButton(BuildContext context, Map<String, String> faq) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () => _showAnswer(context, faq),
      child: Row(
        children: [
          Expanded(
            child: Text(
              faq['question'] ?? '',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _buildContactTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  void _showAnswer(BuildContext context, Map<String, String> faq) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(faq['question'] ?? ''),
        content: Text(faq['answer'] ?? ''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kapat', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
