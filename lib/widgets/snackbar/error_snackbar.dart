import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

showErrorSnackBar(BuildContext context, String text) {
  Flushbar(
    icon: const Icon(
      Icons.error,
      color: kWhite,
    ),
    message: text,
    backgroundColor: kRed,
    messageColor: kWhite,
    flushbarPosition: FlushbarPosition.TOP,
    animationDuration: kDefaultDuration,
    duration: kExtraLargeDuration,
  ).show(context);
}
