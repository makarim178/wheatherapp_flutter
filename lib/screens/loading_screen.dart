
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/location_screen.dart';
import '../services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute<void>(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
    );}));


    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return LoadingScreen();
    // }));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),

    );
  }
}




// <key>NSLocationWhenInUseUsageDescription</key>
// <string>This app Needs access to location when open.</string>

// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />