import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';

class CenterLoading extends StatelessWidget {
  const CenterLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withAlpha(30),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(kDefaultSpacing),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            ),
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}
