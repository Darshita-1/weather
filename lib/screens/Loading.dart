import 'package:flutter/material.dart';
import 'package:weather/screens/Location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    print('Started');
    super.initState();
    getlocation();
  }

  void getlocation() async {
    var data = await WeatherModel().getlocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: data,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpinKitFadingCircle(
      color: Colors.white,
      size: 80.0,
    ));
  }
}
