class StationModel {
  final String id;
  final String stationName;
  final String address;
  final String locationLat;
  final String locationLong;
  final String? stationImage;
  final double distanceInKm;

  StationModel({
    required this.id,
    required this.stationName,
    required this.address,
    required this.locationLat,
    required this.locationLong,
    required this.stationImage,
    required this.distanceInKm,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    double distanceInMeters =
        double.tryParse(json["distance_from_user"]) ?? 0.0;
    double distanceInKm = distanceInMeters / 1000;

    return StationModel(
      id: json["station_id"],
      stationName: json["title_en"],
      address: json["address_en"],
      locationLat: json["location_lat"],
      locationLong: json["location_long"],
      stationImage: json["cover"],
      distanceInKm: distanceInKm,
    );
  }
}
