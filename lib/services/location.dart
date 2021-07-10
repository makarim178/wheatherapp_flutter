
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Location {
  double? latitude;
  double? longitude;


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e) {
      print(e);

      LocationPermission permission = await Geolocator.checkPermission();
      if(permission.toString() == "LocationPermission.Denied") {
        permission = await Geolocator.requestPermission();
      }
    }
  }
}