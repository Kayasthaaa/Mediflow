import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageBtns extends StatelessWidget {
  final String label;
  final Color? textColor;
  final Color? color;
  final void Function()? onTap;
  const ImageBtns(
      {Key? key, this.onTap, required this.label, this.textColor, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100.0,
          height: 25.0,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(7.0)),
          child: Center(
              child: Text(
            label,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, fontSize: 15, color: textColor),
          )),
        ));
  }
}
