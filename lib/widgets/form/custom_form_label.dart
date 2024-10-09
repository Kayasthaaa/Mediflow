// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

class CustomFormLabel extends StatelessWidget {
  final String label;
  final bool required;
  final bool verticalPadding;
  const CustomFormLabel({
    Key? key,
    required this.label,
    this.required = false,
    this.verticalPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: verticalPadding
          ? const EdgeInsets.symmetric(vertical: kSmallSpacing)
          : EdgeInsets.zero,
      child: Wrap(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          required
              ? const Text(
                  '*',
                  style: TextStyle(
                    color: kRed,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
