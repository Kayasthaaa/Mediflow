import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyImages extends StatelessWidget {
  final Widget? widget;
  final IconData? icon;
  final String label;
  final Function()? onTap;
  const MyImages(
      {Key? key, this.widget, required this.label, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 22.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            ClipOval(
              child: Container(
                height: 110.0,
                width: 110.0,
                color: Colors.amber,
                child: widget,
              ),
            ),
            const SizedBox(
              height: 9.0,
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 22.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(9.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.lato(fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        icon,
                        size: 23,
                        color: Colors.black,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
