import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tezgel_app/models/product_models/product_model.dart';
import 'package:tezgel_app/services/reservation_services.dart';
import 'package:tezgel_app/services/storage_service.dart';

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
  static const int _initialSeconds = 600; // 10 dk
  late int _remainingSeconds;
  Timer? _timer;
  Timer? _statusTimer;
  String? _statusText = 'Bekleniyor...';
  bool _loadingStatus = false;
  bool _isCompleting = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _initialSeconds;
    _startTimer();
    _fetchStatus();
    _startStatusTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        t.cancel();
      }
    });
  }

  void _startStatusTimer() {
    _statusTimer = Timer.periodic(const Duration(seconds: 10), (_) => _fetchStatus());
  }

  Future<void> _fetchStatus() async {
    if (_loadingStatus) return;
    setState(() => _loadingStatus = true);

    try {
      final token = await StorageService.getToken();
      if (token == null) {
        setState(() => _statusText = 'Oturum bulunamadı');
        return;
      }
      final response = await ReservationServices()
          .statusReservation(token, widget.reservationId);
      setState(() {
        _statusText = response.data?.toString() ?? 'Pending...';
      });
    } catch (_) {
      setState(() => _statusText = 'Pending...');
    } finally {
      setState(() => _loadingStatus = false);
    }
  }

  Future<void> _onCompleteReservationPressed() async {
    final businessId = await Navigator.push<String?>(
      context,
      MaterialPageRoute(builder: (_) => QRViewExample()),
    );
    if (businessId != null) _completeReservation(businessId);
  }

  Future<void> _completeReservation(String businessId) async {
    setState(() => _isCompleting = true);
    try {
      final token = await StorageService.getToken();
      if (token == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Oturum bulunamadı')));
        return;
      }
      await ReservationServices()
          .completeReservation(token, widget.reservationId, businessId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rezervasyon başarıyla tamamlandı!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Hata: $e')));
    } finally {
      setState(() => _isCompleting = false);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _statusTimer?.cancel();
    super.dispose();
  }

  String _formatDuration(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final ss = (s % 60).toString().padLeft(2, '0');
    return '$m:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezervasyon Detayı'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.check_circle, color: Colors.green, size: 64)),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Rezervasyon Oluşturuldu!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Kalan Süre Kartı
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.timer, color: Colors.orange),
                    const SizedBox(width: 8),
                    // Expanded + ellipsis ile overflow önleniyor
                    Expanded(
                      child: Text(
                        'Kalan Süre: ${_formatDuration(_remainingSeconds)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),

            const SizedBox(height: 32),
            Text('Ürün Bilgileri',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            Text(product.name ?? '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description ?? '', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Row(children: [
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
            ]),

            // Butona yakınlaşmak için Spacer yerine sabit boşluk
            const SizedBox(height: 24),

            if (_remainingSeconds == 0)
              Center(
                child: Text(
                  'Rezervasyon süresi doldu.',
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),

            if (_remainingSeconds > 0)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton.icon(
                    onPressed:
                        _isCompleting ? null : _onCompleteReservationPressed,
                    icon: const Icon(Icons.qr_code_scanner, size: 32),
                    label: _isCompleting
                        ? const SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(strokeWidth: 3),
                          )
                        : const Text(
                            'Rezervasyonu Tamamla',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

            // Altta biraz boşluk
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// QR kod okuma ekranı
class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _scanned = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Kodu Tara')),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.orange,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    ctrl.scannedDataStream.listen((scanData) {
      if (!_scanned) {
        _scanned = true;
        ctrl.pauseCamera();
        Navigator.of(context).pop(scanData.code);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
