import 'package:geolocator/geolocator.dart';

class Location {
  double? latitute;
  double? longtute;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitute = position.latitude;
      longtute = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
