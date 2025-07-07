import 'dart:async';

import 'package:evcharge/services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    super.key,
    required this.zoom,
    required this.latLng,
  });

  final double zoom;
  final LatLng latLng;

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late LocationServices locationServices;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    initialCameraPosition =
        CameraPosition(zoom: widget.zoom, target: widget.latLng);

    locationServices = LocationServices();
    updateMyLocation();

    super.initState();
  }

  bool isFirstCall = true;

  @override
  void dispose() {
    googleMapController!.dispose();
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        markers: markers,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
        zoomControlsEnabled: false,
        initialCameraPosition: initialCameraPosition);
  }

  void updateMyLocation() async {
    await locationServices.checkAndRequestLocationScervice();
    var hasPermission =
        await locationServices.checkAndRequestLocationPermission();
    if (hasPermission) {
      streamSubscription =
          locationServices.getRealTimeLocationData((LocationData) {
        var myLocationMarker = Marker(
          markerId: MarkerId("My Location Marker"),
          position: LatLng(LocationData.latitude!, LocationData.longitude!),
        );
        markers.add(myLocationMarker);

        setState(() {});

        if (isFirstCall) {
          CameraPosition cameraPosition = CameraPosition(
              target: LatLng(LocationData.latitude!, LocationData.longitude!),
              zoom: 17);
          googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(cameraPosition),
          );
          isFirstCall = false;
        } else {
          googleMapController?.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(LocationData.latitude!, LocationData.longitude!),
            ),
          );
        }
      });
    }
  }
}
