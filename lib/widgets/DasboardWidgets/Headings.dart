import 'package:flutter/material.dart';

class Headings extends StatelessWidget {
  final ImageProvider<Object>? imageIcon;
  final Color? color;
  final String? label;
  const Headings({
    Key? key,
    this.color,
    this.label,
    required this.imageIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      color: Colors.transparent,
      child: Row(children: [
        SizedBox(
            child: ImageIcon(
          imageIcon,
          size: 25,
        )),
        const SizedBox(
          width: 9.0,
        ),
        Text(
          label!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ]),
    );
  }
}
