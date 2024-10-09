import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/hospital_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';

class OnlineTicketScreen extends StatelessWidget {
  const OnlineTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose'),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(kExtraLargeSpacing),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: kDefaultSpacing,
        children: [
          Column(
            children: [
              const Text(
                'Hospital',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: kSmallSpacing),
              Material(
                color: kWhite,
                shadowColor: kShadowColor,
                elevation: 3.5,
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    List<HospitalModel> hospitalList =
                        context.read<OnlineticketCubit>().state.hospitalList;
                    if (hospitalList.isEmpty) {
                      context.read<OnlineticketCubit>().getCompanyList();
                    }
                    Navigator.of(context).pushNamed('/online-ticket-hospital');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultSpacing,
                      vertical: kMediumLargeSpacing,
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/images/online_ticket/hospital.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Doctor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: kSmallSpacing),
              Material(
                color: kWhite,
                shadowColor: kShadowColor,
                elevation: 3.5,
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    context.read<OnlineticketCubit>().getAllDoctor();
                    Navigator.of(context)
                        .pushNamed('/online-ticket-all-doctor');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultSpacing,
                      vertical: kMediumLargeSpacing,
                    ),
                    child: Image(
                      image:
                          AssetImage('assets/images/online_ticket/doctor.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
