import 'dart:async';

import 'package:location/location.dart';

class LocationServices {
  Location location = Location();

  Future<bool> checkAndRequestLocationScervice() async {
    var isServiceEnable = await location.serviceEnabled();
    if (!isServiceEnable) {
      isServiceEnable = await location.requestService();
      if (!isServiceEnable) {
        return false;
      }
    }

    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }

    return true;
  }

  StreamSubscription getRealTimeLocationData(
      void Function(LocationData)? onData) {
    return location.onLocationChanged.listen(onData);
  }
}
