import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Features extends StatelessWidget {
  final Function()? onTap;
  final Widget widget;
  final String label;
  final IconData icons;
  const Features(
      {Key? key,
      this.onTap,
      required this.widget,
      required this.label,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 22.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7.0)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            // width: MediaQuery.of(context).size.width / 1.5,
            color: Colors.transparent,
            height: 55.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 25.0,
                ),
                Container(
                  color: Colors.transparent,
                  height: 45.0,
                  width: 45.0,
                  child: widget,
                ),
                const SizedBox(
                  width: 26.0,
                ),
                Text(
                  label,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 55.0,
                  color: Colors.transparent,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      icons,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
