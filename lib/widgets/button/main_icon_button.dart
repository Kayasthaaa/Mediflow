import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

class MainIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const MainIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBlue.withAlpha(50),
      borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(kExtraSmallSpacing),
          child: Icon(
            icon,
            color: kBlue,
          ),
        ),
      ),
    );
  }
}
