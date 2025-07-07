import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenMap {
  Future<void> openMap(double lat, double long) async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final String googleUrl =
          "https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=$lat,$long";
      final Uri url = Uri.parse(googleUrl);
      launchUrl(url);
    } catch (e) {
      throw e;
    }
  }
}
