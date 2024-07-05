import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/sevices/weather_colunm.dart';
import 'package:weather_app/sevices/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherClass? weatherInfo;

  @override
  void initState() {
    super.initState();
    Future.microtask(myWeather);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE d, MMMM yyyy').format(
      DateTime.now(),
    );
    String formattedTime = DateFormat('hh:mm a').format(
      DateTime.now(),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 125, 211),
      body: weatherInfo == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: WeatherDetail(
                  weather: weatherInfo!,
                  formattedDate: formattedDate,
                  formattedTime: formattedTime,
                ),
              ),
            ),
    );
  }

  myWeather() async {
    await WeatherServices().fetchWeather().then((value) {
      setState(() {
        weatherInfo = value;
      });
      // weatherInfo == null
      //     ? print("nothing")
      //     : print("info${weatherInfo!.toJson()}");
    });
  }
}
