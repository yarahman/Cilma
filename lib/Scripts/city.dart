import 'package:flutter/material.dart';

class CityLocation extends StatefulWidget {
  const CityLocation({Key? key}) : super(key: key);

  @override
  _CityLocationState createState() => _CityLocationState();
}

class _CityLocationState extends State<CityLocation> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (value) {
                    cityName = value;
                    Navigator.pop(context, cityName);
                  },
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: 'E.G London',
                    labelText: 'Enter City Name',
                    labelStyle:
                        TextStyle(color: Colors.greenAccent, fontSize: 30.0),
                    hintStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
