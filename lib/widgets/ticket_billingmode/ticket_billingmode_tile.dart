// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

class TicketBillingModeTile extends StatelessWidget {
  final bool isSelected;
  final BillingModeModel billingModeModel;
  final void Function()? onTap;
  const TicketBillingModeTile({
    Key? key,
    required this.isSelected,
    required this.billingModeModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kDefaultSpacing),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kBlue),
          borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
        ),
        child: Material(
          color: isSelected ? kBlue.withAlpha(80) : kWhite,
          borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(kSmallSpacing),
              child: Text(
                billingModeModel.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
