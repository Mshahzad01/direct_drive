import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldMapWidget extends StatefulWidget {
  const WorldMapWidget({super.key});

  @override
  State<WorldMapWidget> createState() => _WorldMapWidgetState();
}

class _WorldMapWidgetState extends State<WorldMapWidget> {
  GoogleMapController? _mapController;
  Marker? _currentLocationMarker;

  LatLng _initialPosition = LatLng(0, 0); 
  String _mapStyle = "";

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _goToCurrentLocation(); 
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/assets/map_style.json');
  }

  Future<void> _goToCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _initialPosition = currentLatLng;
      _currentLocationMarker = Marker(
        markerId: MarkerId('currentLocation'),
        position: currentLatLng,
        infoWindow: InfoWindow(title: 'You are here!'),
      
      );
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(currentLatLng, 16),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            _mapController = controller;
            controller.setMapStyle(_mapStyle);

            if (_initialPosition.latitude != 0) {
              _mapController?.animateCamera(
                CameraUpdate.newLatLngZoom(_initialPosition, 16),
              );
            }
          },
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 2.0,
          ),
     
          
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          markers:
              _currentLocationMarker != null ? {_currentLocationMarker!} : {},
        ),


        // Positioned(
        //   bottom: 100,
        //   right: 20,
        //   child: GestureDetector(
        //     onTap: _goToCurrentLocation,
        //     child: CircleAvatar(
        //       backgroundColor: Colors.black87,
        //       child: Icon(Icons.my_location, color: Colors.white),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
