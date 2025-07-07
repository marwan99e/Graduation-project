import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      name: "turkish",
      latLng: LatLng(31.71265036362789, 35.95023886974521)),
  PlaceModel(
      id: 2,
      name: "kandy",
      latLng: LatLng(31.69373735818138, 35.92946784439691)),
  PlaceModel(
      id: 3,
      name: "loyal",
      latLng: LatLng(31.68891721133975, 35.92963950576343)),
];
