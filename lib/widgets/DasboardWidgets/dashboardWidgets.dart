import 'package:flutter/material.dart';

class MediaContainer extends StatelessWidget {
  final Color? color;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final void Function()? onTap;
  const MediaContainer(
      {Key? key,
      this.height,
      this.decoration,
      this.color,
      this.margin,
      this.child,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: decoration,
          color: color,
          margin: margin,
          child: child),
    );
  }
}
