import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
// import 'package:weather_app/models/secrets.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  Future fetchWeather() async {
    // String Base_Url = "http://api.openweathermap.org/data/2.5/weather";
    String cityName = '';
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?$cityName&cnt=5&appid=?&units=metric"),
    );

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherClass.fromJson(json);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getCurrentCity() async {
    //  get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // fetch the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

// convert the location into a list of placemark
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // extract the city from the first placemark
    String? city = placemark[0].locality;

    return city ?? '';
  }
//   Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//       'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }
}
