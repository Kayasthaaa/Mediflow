import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/services/date_formatter.dart';

enum NotificationType { general, done, reminder }

class NotificationTile extends StatelessWidget {
  final NotificationType notificationType;
  final String title;
  final String subtitle;
  final DateTime dateTime;
  final bool showDateTime;
  const NotificationTile({
    super.key,
    this.notificationType = NotificationType.general,
    required this.title,
    required this.subtitle,
    required this.dateTime,
    this.showDateTime = false,
  });

  returnAssetType() {
    if (notificationType == NotificationType.general) {
      return 'assets/images/notification/general.png';
    } else if (notificationType == NotificationType.done) {
      return 'assets/images/notification/done.png';
    } else {
      return 'assets/images/notification/reminder.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          showDateTime
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultSpacing,
                  ),
                  child: Text(
                      CustomDateFormatter.longScheduleDateFormatter(dateTime)),
                )
              : const SizedBox.shrink(),
          Material(
            color: kWhite,
            borderRadius: BorderRadius.circular(kDefaultSpacing),
            elevation: 1.0,
            shadowColor: kShadowColor,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultSpacing),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(returnAssetType()),
                    width: 64.0,
                    height: 64.0,
                  ),
                  const SizedBox(width: kDefaultSpacing),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: kSmallSpacing),
                        Text(subtitle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
