import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  final String text;
  // final TextEditingController locationcontroller;

  const TextPage({
    super.key,
    required this.text,
    // required this.locationcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 225, 219, 247),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onEditingComplete: () {},
          // controller: locationcontroller,
          onChanged: (value) {},
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.location_pin,
            ),
            suffixIcon: Icon(Icons.search),
            hintText: text,
            hintStyle: const TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 144, 125, 211),
            ),
          ),
        ),
      ),
    );
  }
}
