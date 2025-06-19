import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tezgel_app/models/product_models/product_model.dart';
import 'package:tezgel_app/services/reservation_services.dart';
import '../services/storage_service.dart';

class ReservationScreen extends StatefulWidget {
  final Product product;
  final String reservationId;

  const ReservationScreen({
    Key? key,
    required this.product,
    required this.reservationId,
  }) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  static const int _initialSeconds = 600; // 10 dakika
  late int _remainingSeconds;
  Timer? _timer;
  Timer? _statusTimer;
  String? _statusText = 'Bekleniyor...';
  bool _loadingStatus = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _initialSeconds;
    _startTimer();
    _fetchStatus();
    _startStatusTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _startStatusTimer() {
    _statusTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _fetchStatus();
    });
  }

  Future<void> _fetchStatus() async {
    if (_loadingStatus) return;
    setState(() {
      _loadingStatus = true;
    });
    try {
      final token = await StorageService.getToken();
      if (token == null) {
        setState(() {
          _statusText = 'Oturum bulunamadı';
        });
        return;
      }
      final response = await ReservationServices().statusReservation(token, widget.reservationId);
      // response.data'nın string olup olmadığını kontrol et ve göster
      String? status;
      if (response.data != null) {
        status = response.data.toString();
      } else {
        status = 'Durum alınamadı';
      }
      setState(() {
        _statusText = status;
      });
    } catch (e) {
      setState(() {
        _statusText = 'Durum alınamadı';
      });
    } finally {
      setState(() {
        _loadingStatus = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _statusTimer?.cancel();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezervasyon Detayı'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(Icons.check_circle, color: Colors.green, size: 64),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Rezervasyon Oluşturuldu!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800]),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timer, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text(
                      'Kalan Süre: ${_formatDuration(_remainingSeconds)}',
                      style: const TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: _loadingStatus
                  ? const CircularProgressIndicator()
                  : Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Rezervasyon Durumu: ${_statusText ?? ''}',
                        style: const TextStyle(fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            const SizedBox(height: 32),
            Text('Ürün Bilgileri', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            if (product.imagePath != null && product.imagePath!.startsWith('http'))
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imagePath!,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 12),
            Text(product.name ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description ?? '', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                if (product.originalPrice != null)
                  Text(
                    '₺${product.originalPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                const SizedBox(width: 8),
                if (product.discountedPrice != null)
                  Text(
                    '₺${product.discountedPrice}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            const Spacer(),
            if (_remainingSeconds == 0)
              Center(
                child: Text(
                  'Rezervasyon süresi doldu.',
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
