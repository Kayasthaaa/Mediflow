import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFields extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final IconData? icon;
  final InputBorder border;
  final Color? color;
  final Color? fillColor;
  final double? height;
  final EdgeInsetsGeometry contentPadding;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;
  final String? hintText;
  final bool readOnly;
  final bool? filled;
  final void Function(String?)? onsaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function()? onSuffixPressed;
  const RegisterFields({
    Key? key,
    this.label,
    this.icon,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onSuffixPressed,
    this.obscureText = false,
    this.readOnly = false,
    this.filled = false,
    this.onsaved,
    required this.border,
    this.height,
    required this.contentPadding,
    this.color,
    this.margin,
    this.hintText,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: height,
          margin: margin,
          child: TextFormField(
            minLines: 1,
            maxLines: 10,
            readOnly: readOnly,
            //obscureText: obscureText,
            controller: controller,
            onChanged: onChanged,
            onSaved: onsaved,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    icon,
                    size: 25,
                    color: Colors.grey,
                  ),
                  onPressed: onSuffixPressed,
                ),
                isDense: true,
                labelText: label,
                filled: filled,
                fillColor: fillColor,
                hintText: hintText,
                hintStyle: GoogleFonts.lato(
                    textStyle: (const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
                contentPadding: contentPadding,
                border: border),
          ),
        )
      ],
    );
  }
}
