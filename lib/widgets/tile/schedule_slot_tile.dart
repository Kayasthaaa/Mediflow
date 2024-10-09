// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mediflow_bloc/Models/online_ticket/schedule_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/services/date_formatter.dart';

class ScheduleSlotTile extends StatelessWidget {
  final bool isSelected;
  final ScheduleModel scheduleModel;
  final void Function()? onTap;
  const ScheduleSlotTile({
    Key? key,
    required this.isSelected,
    required this.scheduleModel,
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
              padding: const EdgeInsets.all(kExtraSmallSpacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CustomDateFormatter.shortScheduleDateFormatter(
                        scheduleModel.date),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: kExtraSmallSpacing),
                  Text(
                    '${scheduleModel.quota} Slot Available',
                    style: TextStyle(
                      color: kGreen,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
