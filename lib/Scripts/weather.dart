import 'location.dart';
import 'networking.dart';

const appId = 'f0b56f6a05f3c4ea5e23284110c8b227';
const apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityLocation(String cityName) async {
    var Url = '$apiUrl?q=$cityName&appid=$appId&units=metric';
    Networking networkHelper = Networking(Url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();

    Networking networkHelper = Networking(
        '$apiUrl?lat=${location.latitute}&lon=${location.longtute}&appid=$appId&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
