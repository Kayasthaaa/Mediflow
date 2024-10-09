import 'package:flutter/material.dart';

import 'dasboardButtons.dart';

class LabContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final String header;
  final String body;
  final void Function()? onTap;
  final Widget? widget;
  final String footer;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  const LabContainer({
    Key? key,
    this.width,
    this.height,
    this.margin,
    required this.header,
    required this.body,
    required this.footer,
    this.color,
    this.widget,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      width: width,
      height: 116.0,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(7.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 6.0,
          ),
          Text(
            header,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              body,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: size.width * 0.025,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              footer,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: size.width * 0.025,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 3.09,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 13,
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.0)),
              child: Center(
                  child: Text(
                "ADD",
                style: TextStyle(
                  fontSize: size.width * 0.025,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue,
                ),
              )),
            ),
          ),
          const SizedBox(
            height: 3.0,
          )
        ],
      ),
    );
  }
}
