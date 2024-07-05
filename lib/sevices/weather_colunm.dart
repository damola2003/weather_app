// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/sevices/dailyForcast.dart';
import 'package:weather_app/sevices/others.dart';
import 'package:weather_app/sevices/textfield.dart';
// import 'package:weather_app/sevices/textfield.dart';

class WeatherDetail extends StatelessWidget {
  final WeatherClass weather;
  final String formattedDate;
  final String formattedTime;
  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  String fetchWeatherInfo(String? weather) {
    if (weather == null) return "lib/animation/cloud2.json";

    switch (weather.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "lib/animation/cloud.json";
      case "drizzle":
      case "shower rain":
      case "rain":
        return "lib/animation/cloud3.json";
      case "thunderstorm":
        return "lib/animation/cloud4.json";
      case "clear":
        return "lib/animation/cloud2.json";
      default:
        return "lib/animation/cloud2.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
        
          const TextPage(text: "Search location"),
          const SizedBox(
            height: 10,
          ),
          Column(children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.refresh,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // ),
            Text(
              weather.city?.name ?? '',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ]),
          Text(
            "${weather.weatherlist?.first.main!.temp ?? 0.0}°C",
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          Lottie.asset(
              fetchWeatherInfo(
                weather.weatherlist?.first.weather!.first.main ?? "",
              ),
              width: MediaQuery.of(context).size.width / 2.5),
          (weather.weatherlist != null)
              ? Text(
                  weather.weatherlist?.first.weather!.first.main ?? '',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )
              : const Text(""),
          Text(
            formattedDate,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            formattedTime,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                "Daily Forcast",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weather.weatherlist!.length,
                itemBuilder: (context, index) {
                  final time = DateTime.parse(
                      weather.weatherlist![index].dtTxt.toString());
                  final day = DateTime.parse(
                      weather.weatherlist![index].dtTxt.toString());
                  return weather.weatherlist == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: DailyForcast(
                            day: DateFormat('EEEE').format(day),
                            icon: (weather.weatherlist![index].main ==
                                        'Clouds' ||
                                    weather.weatherlist![index].main == 'Rain'
                                ? Icons.sunny
                                : Icons.thunderstorm),
                            time: DateFormat.Hm().format(time),
                            texti:
                                "${weather.weatherlist?[index].main!.temp ?? 0.0}°C",
                          ),
                        );
                }),
          ),
          // const SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Additional Information",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 219, 247),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RowPage(
                        icon: Icons.wind_power,
                        texti: "${weather.weatherlist?.first.wind!.speed}km/h",
                        text: "Wind",
                      ),
                      RowPage(
                        icon: Icons.beach_access,
                        texti: "${weather.weatherlist?.first.main!.pressure} ",
                        text: "Pressure",
                      ),
                      RowPage(
                        icon: Icons.water_drop,
                        texti:
                            "${weather.weatherlist?.first.main!.humidity} g/kg",
                        text: "humidity",
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
