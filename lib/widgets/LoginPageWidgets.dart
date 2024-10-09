import 'package:flutter/material.dart';

class LoginWidgets extends StatelessWidget {
  final String label;
  final IconData? icon;
  final IconData? iconSuffix;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function()? onSuffixPressed;
  final void Function(String?)? onSaved;
  const LoginWidgets({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onSuffixPressed,
    this.iconSuffix,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      width: size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            onSaved: onSaved,
            obscureText: obscureText,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: Colors.grey,
                  size: 25,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    iconSuffix,
                    size: 27,
                    color: Colors.blueGrey,
                  ),
                  onPressed: onSuffixPressed,
                ),
                isDense: true,
                hintText: label,
                contentPadding: const EdgeInsets.all(17.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29.0))),
          ),
        ],
      ),
    );
  }
}
