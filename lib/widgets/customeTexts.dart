import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTexts extends StatelessWidget {
  final String label;
  const CustomTexts({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Text(
        label,
        style: GoogleFonts.lato(
            textStyle:
                const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
