import 'package:cilma/Scripts/city.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'weather.dart';

class Location_Screen extends StatefulWidget {
  Location_Screen({required this.weatherData});
  final weatherData;

  @override
  _Location_ScreenState createState() => _Location_ScreenState();
}

int? temp;
int? idendity;
String? cityName;

class _Location_ScreenState extends State<Location_Screen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temp = 0;
        cityName = 'not found';
        idendity = 404;
        return;
      }
      double tempature = data["main"]["temp_min"];
      temp = tempature.toInt();
      cityName = data["name"];
      idendity = data["weather"][0]["id"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            WeatherModel weatherModel = new WeatherModel();
            var weatherData = await weatherModel.getLocationData();
            updateUI(weatherData);
          },
          icon: Icon(
            Icons.send,
            size: 40.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var typeName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityLocation();
              }));

              if (typeName != null) {
                WeatherModel weather = new WeatherModel();
                var weatherData = await weather.getCityLocation(typeName);
                updateUI(weatherData);
              }
            },
            icon: Icon(
              Icons.location_city,
              size: 40.0,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                "$temp'",
                style: TextStyle(
                    fontSize: 150.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.wb_sunny,
                size: 100.0,
                color: Colors.yellow,
              )
            ],
          ),
          Text(
            "$cityName",
            style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
