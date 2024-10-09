import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

enum ButtonType { primary, secondary, red }

class MainFilledIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final ButtonType buttonType;
  const MainFilledIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.buttonType = ButtonType.primary,
  });

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
    return Material(
      color: _backgroundColorGenerator(),
      borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kExtraSmallSpacing,
            vertical: 3.0,
          ),
          child: Icon(
            icon,
            color: _textColorGenerator(),
          ),
        ),
      ),
    );
  }
}
