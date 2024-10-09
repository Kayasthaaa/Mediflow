import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

enum ButtonBorderRadius { extraSmall, small, medium, large }

enum ButtonType { primary, secondary, red }

class MainButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final ButtonBorderRadius buttonBorderRadius;
  final ButtonType buttonType;
  const MainButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonBorderRadius = ButtonBorderRadius.medium,
    this.buttonType = ButtonType.primary,
  });

  double _borderRadiusGenerator() {
    if (buttonBorderRadius == ButtonBorderRadius.large) {
      return kLargeBorderRadius;
    } else if (buttonBorderRadius == ButtonBorderRadius.medium) {
      return kDefaultBorderRadius;
    } else if (buttonBorderRadius == ButtonBorderRadius.small) {
      return kSmallBorderRadius;
    } else {
      return kExtraSmallBorderRadius;
    }
  }

  Color _backgroundColorGenerator() {
    if (buttonType == ButtonType.primary) {
      return kBlue;
    } else if (buttonType == ButtonType.secondary) {
      return kBackground;
    } else {
      return kRed;
    }
  }

  Color _textColorGenerator() {
    if (buttonType == ButtonType.secondary) {
      return kOnBackground;
    } else {
      return kWhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _backgroundColorGenerator(),
        ),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadiusGenerator()),
        )),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(kMediumSmallSpacing),
        child: Text(
          title,
          style: TextStyle(
            color: _textColorGenerator(),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
