import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'package:cilma/Scripts/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void GetLocationData() async {
    var weatherData = await WeatherModel().getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Location_Screen(
            weatherData: weatherData,
          );
        },
      ),
    );
  }

  void GetPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }

  @override
  void initState() {
    super.initState();
    GetPermission();
    GetLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cilma"),
        centerTitle: true,
      ),
      body: Center(
        child: SpinKitSpinningLines(
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
