import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezgel_app/services/business_service.dart';
import 'package:tezgel_app/services/customer_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationListScreen extends StatefulWidget {
  final String? role;
  const ReservationListScreen({Key? key, this.role}) : super(key: key);

  @override
  State<ReservationListScreen> createState() => _ReservationListScreenState();
}

class _ReservationListScreenState extends State<ReservationListScreen> {
  bool isLoading = true;
  List<dynamic> reservations = [];
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchReservations();
  }

  Future<void> _fetchReservations() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      if (token == null) throw Exception('Token bulunamadı');
      dynamic response;
      if (widget.role?.toLowerCase() == 'business') {
        response = await BusinessServices().getReservationList(token);
      } else {
        response = await CustomerServices().getReservationList(token);
      }
      setState(() {
        reservations = response.data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  LatLng? _getLatLng(String? lat, String? lng) {
    final latitude = double.tryParse(lat ?? '');
    final longitude = double.tryParse(lng ?? '');
    if (latitude != null && longitude != null) {
      return LatLng(latitude, longitude);
    }
    return null;
  }

  Widget _buildMapWidget(String? latitude, String? longitude) {
    final latLng = _getLatLng(latitude, longitude);
    if (latLng == null) return const SizedBox.shrink();
    final String mapsUrl = 'https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}';
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(mapsUrl)) {
          await launch(mapsUrl);
        }
      },
      child: Container(
        height: 160,
        margin: const EdgeInsets.only(top: 10, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: latLng, zoom: 15),
              markers: {
                Marker(markerId: const MarkerId('reservation-location'), position: latLng),
              },
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              liteModeEnabled: true,
              onTap: (_) {}, // Sadece görüntü amaçlı, etkileşim yok
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                color: Colors.white70,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: const [
                    Icon(Icons.map, color: Colors.green, size: 18),
                    SizedBox(width: 4),
                    Text('Haritalarda Aç', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReservationCard(dynamic item) {
    if (item == null) return const SizedBox.shrink();
    final map = item is Map ? item : (item.toJson != null ? item.toJson() : {});

    // Ürün fotoğrafı için image, productImage ve imagePath anahtarlarını kontrol et
    String? imageUrl = map['image']?.toString();
    if ((imageUrl == null || imageUrl.isEmpty) && map['productImage'] != null) {
      imageUrl = map['productImage']?.toString();
    }
    if ((imageUrl == null || imageUrl.isEmpty) && map['imagePath'] != null) {
      imageUrl = map['imagePath']?.toString();
    }

    final String? companyName = map['companyName']?.toString();
    final String? expireAt = map['expireAt']?.toString();
    final String? productName = map['productName']?.toString();
    final String? originalPrice = map['originalPrice']?.toString();
    final String? discountedPrice = map['discountedPrice']?.toString();
    final String? latitude = map['latitude']?.toString();
    final String? longitude = map['longitude']?.toString();

    // Sadece gerekli alanlar gösterilecek, diğerleri gösterilmeyecek

    String? formattedExpireAt;
    if (expireAt != null && expireAt.isNotEmpty) {
      try {
        final dt = DateTime.parse(expireAt);
        formattedExpireAt = "${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
      } catch (_) {
        formattedExpireAt = expireAt;
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageUrl != null && imageUrl.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, color: Colors.grey),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (companyName != null && companyName.isNotEmpty)
                        Text(
                          companyName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange),
                        ),
                      if (productName != null && productName.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            productName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      if (formattedExpireAt != null && formattedExpireAt.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              const Icon(Icons.timer, size: 16, color: Colors.red),
                              const SizedBox(width: 4),
                              Text(
                                formattedExpireAt,
                                style: const TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            if (originalPrice != null && originalPrice.isNotEmpty)
                              Text(
                                '$originalPrice ₺',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            if (discountedPrice != null && discountedPrice.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  '$discountedPrice ₺',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (latitude != null && longitude != null && latitude.isNotEmpty && longitude.isNotEmpty)
              _buildMapWidget(latitude, longitude),
            // Alt kısımda başka bilgi gösterilmeyecek
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezervasyonlarım'),
        backgroundColor:  Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : reservations.isEmpty
                  ? const Center(child: Text('Rezervasyon bulunamadı.'))
                  : ListView.builder(
                      itemCount: reservations.length,
                      itemBuilder: (context, i) {
                        return _buildReservationCard(reservations[i]);
                      },
                    ),
    );
  }
}
