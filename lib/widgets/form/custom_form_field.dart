// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

class CustomFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool autofocus;
  final Widget? suffixIcon;
  final bool readOnly;
  final String? initialValue;
  final String? hintText;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? prefixText;
  final int? maxLength;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  const CustomFormField({
    Key? key,
    this.onChanged,
    this.onTap,
    this.autofocus = false,
    this.suffixIcon,
    this.readOnly = false,
    this.initialValue,
    this.hintText,
    this.textInputAction,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.prefixText,
    this.maxLength,
    this.controller,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        readOnly: readOnly,
        onChanged: onChanged,
        onTap: onTap,
        initialValue: initialValue,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        validator: validator,
        maxLength: maxLength,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: kSmallSpacing,
            vertical: 0.0,
          ),
          filled: true,
          fillColor: kWhite,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kOnBackground.withAlpha(50),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kOnBackground.withAlpha(50),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kBlue,
            ),
          ),
          disabledBorder: InputBorder.none,
          hintText: hintText,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kRed,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kRed,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixText: prefixText,
        ),
      ),
    );
  }
}
