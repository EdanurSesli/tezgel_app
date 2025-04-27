import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

Future<String?> selectLocation(BuildContext context) async {
  LatLng selectedLocation = const LatLng(41.0082, 28.9784); // Başlangıç: İstanbul

  return await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LocationPickerScreen(initialLocation: selectedLocation),
    ),
  );
}

class LocationPickerScreen extends StatefulWidget {
  final LatLng initialLocation;

  const LocationPickerScreen({super.key, required this.initialLocation});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late LatLng _pickedLocation;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _pickedLocation = widget.initialLocation;
  }

  void _onTap(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  Future<void> _confirmLocation() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      _pickedLocation.latitude,
      _pickedLocation.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String address = "${place.street}, ${place.locality}";
      Navigator.pop(context, address);
    } else {
      Navigator.pop(context, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konum Seç')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pickedLocation,
          zoom: 14,
        ),
        myLocationEnabled: true,
        onMapCreated: (controller) => _mapController = controller,
        onTap: _onTap,
        markers: {
          Marker(
            markerId: const MarkerId('picked-location'),
            position: _pickedLocation,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _confirmLocation,
        label: const Text('Konumu Onayla'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
