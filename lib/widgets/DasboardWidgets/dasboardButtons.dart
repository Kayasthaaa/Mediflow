import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAppointmentBtns extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const BookAppointmentBtns({Key? key, this.onTap, s, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 145.0,
          height: 33.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.2),
            color: const Color.fromARGB(240, 54, 87, 197),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white))),
            ],
          ),
        ));
  }
}
