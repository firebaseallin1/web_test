

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GlobalGoogleMapWidget extends StatelessWidget {
  const GlobalGoogleMapWidget({super.key, required this.position, required this.competeController});
  final  CameraPosition position;
  final Completer<GoogleMapController> competeController ;

  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      initialCameraPosition: position,
      onMapCreated: (GoogleMapController controller) {
        competeController.complete(controller);
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
