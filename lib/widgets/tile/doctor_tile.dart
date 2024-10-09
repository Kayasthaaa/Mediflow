import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/doctor_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/hospital_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';

class DoctorTile extends StatelessWidget {
  final DoctorModel doctorModel;
  final bool withoutHospital;
  final void Function()? onTap;
  const DoctorTile({
    super.key,
    required this.doctorModel,
    this.withoutHospital = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    HospitalModel? hospitalModel;
    if (!withoutHospital) {
      hospitalModel = context
          .read<OnlineticketCubit>()
          .state
          .hospitalList
          .firstWhere((element) =>
              element.id == context.read<OnlineticketCubit>().state.companyId);
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: kSmallSpacing),
      child: Material(
        clipBehavior: Clip.hardEdge,
        shadowColor: kShadowColor,
        elevation: 1.0,
        color: kWhite,
        borderRadius: BorderRadius.circular(kSmallBorderRadius),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(kSmallSpacing),
            child: Row(
              children: [
                const Image(
                  image:
                      AssetImage('assets/images/online_ticket/doctor_icon.png'),
                  width: 64.0,
                  height: 64.0,
                ),
                const SizedBox(width: kSmallSpacing),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorModel.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: kExtraSmallSpacing),
                      Text(
                        doctorModel.post,
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      hospitalModel != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: kSmallSpacing),
                                Text(
                                  hospitalModel.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
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
