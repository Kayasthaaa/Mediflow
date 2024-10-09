import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  final String label;
  final Function()? onpressed;
  final Color color;

  const Mybuttons(
      {Key? key, required this.label, required this.color, this.onpressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: 50.0,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: color,
              // background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 15.0, // foreground
            ),
            onPressed: onpressed,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            )));
  }
}
