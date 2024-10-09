import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/doctor_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/scaffold/search_list_scaffold.dart';
import 'package:mediflow_bloc/widgets/tile/doctor_tile.dart';

class OnlineTicketAllDoctor extends StatelessWidget {
  const OnlineTicketAllDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    List<DoctorModel> doctorList =
        context.select((OnlineticketCubit e) => e.state.allDoctorSearchList);
    return SearchListScaffold(
      title: 'Doctor List',
      onQueryChanged: (value) {
        context.read<OnlineticketCubit>().changeAllDoctorQuery(value);
      },
      child: RefreshIndicator(
        onRefresh: () {
          return context.read<OnlineticketCubit>().getAllDoctor();
        },
        child: Stack(
          children: [
            doctorList.isEmpty && !loading
                ? ListView(
                    children: const [
                      SizedBox(height: kLargeSpacing),
                      Text(
                        'No Doctor Found',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.only(
                      left: kDefaultSpacing,
                      right: kDefaultSpacing,
                      bottom: kDefaultSpacing,
                    ),
                    children: doctorList.map((e) {
                      return DoctorTile(
                        doctorModel: e,
                        withoutHospital: true,
                        onTap: () {
                          context
                              .read<OnlineticketCubit>()
                              .getCompanyListForDoctor(
                                doctorModel: e,
                              );
                          Navigator.of(context).pushNamed(
                              '/online-ticket-all-company-for-doctor');
                        },
                      );
                    }).toList(),
                  ),
            loading ? const CenterLoading() : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
