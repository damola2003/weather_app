import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class DailyForcast extends StatelessWidget {
  final String day;
  final String time;
  final String texti;
  final IconData icon;

  const DailyForcast({
    super.key,
    required this.time,
    required this.texti,
    required this.icon,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        // height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          // color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 144, 125, 211),
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 144, 125, 211),
                ),
              ),
              Icon(icon),
              Text(
                texti,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 25, 27),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
