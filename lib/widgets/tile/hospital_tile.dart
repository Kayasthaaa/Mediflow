import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mediflow_bloc/Models/online_ticket/hospital_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

class HospitalTile extends StatelessWidget {
  final HospitalModel hospitalModel;
  final void Function()? onTap;
  const HospitalTile({
    super.key,
    required this.hospitalModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> phoneNumberList = [];
    if (hospitalModel.phone != '') {
      phoneNumberList.add(hospitalModel.phone);
    }
    if (hospitalModel.mobile != '') {
      phoneNumberList.add(hospitalModel.mobile);
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultSpacing),
      child: Material(
        color: kWhite,
        elevation: 1.0,
        shadowColor: kShadowColor,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultSpacing),
            child: Row(
              children: [
                Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: kOnBackground.withAlpha(30),
                    border: Border.all(
                      color: kOnBackground.withAlpha(100),
                    ),
                    borderRadius: BorderRadius.circular(kSmallSpacing),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(hospitalModel.logoUrl),
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultSpacing),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hospitalModel.name,
                        style: const TextStyle(
                          color: kBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: kExtraSmallSpacing),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kBlue,
                            size: kSmallIcon,
                          ),
                          const SizedBox(width: kExtraSmallSpacing),
                          Text(
                            hospitalModel.address,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: kExtraSmallSpacing),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: kBlue,
                            size: kSmallIcon,
                          ),
                          const SizedBox(width: kExtraSmallSpacing),
                          Text(
                            phoneNumberList
                                .toString()
                                .replaceFirst('[', '')
                                .replaceFirst(']', ''),
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
