import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class RowPage extends StatelessWidget {
  final String text;
  final String texti;
  final IconData icon;
  const RowPage({
    super.key,
    required this.text,
    required this.texti,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
          // color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 144, 125, 211),
                ),
              ),
              const SizedBox(height: 2),
              Icon(
                icon,
                color: const Color.fromARGB(255, 144, 125, 211),
              ),
              Text(texti),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
