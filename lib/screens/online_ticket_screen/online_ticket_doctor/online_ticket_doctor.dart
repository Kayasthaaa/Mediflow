import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/doctor_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/scaffold/search_list_scaffold.dart';
import 'package:mediflow_bloc/widgets/ticket_billingmode/ticket_billingmode.dart';
import 'package:mediflow_bloc/widgets/tile/doctor_tile.dart';

class OnlineTicketDoctor extends StatelessWidget {
  const OnlineTicketDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    List<DoctorModel> doctorList =
        context.select((OnlineticketCubit e) => e.state.doctorSearchList);
    List<BillingModeModel> billingModeList =
        context.select((OnlineticketCubit e) => e.state.billingModeList);
    BillingModeModel selectedBillingMode =
        context.select((OnlineticketCubit e) => e.state.billingModeModel);
    return SearchListScaffold(
      title: 'Doctor List',
      onQueryChanged: (value) {
        context.read<OnlineticketCubit>().changeDoctorQuery(value);
      },
      child: RefreshIndicator(
        onRefresh: () {
          return context.read<OnlineticketCubit>().getDoctor(
                context.read<OnlineticketCubit>().state.departmentId,
              );
        },
        child: Column(
          children: [
            TicketBillingMode(
              billingModeList: billingModeList,
              selectedBillingMode: selectedBillingMode,
            ),
            Expanded(
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
                              onTap: () {
                                context
                                    .read<OnlineticketCubit>()
                                    .selectDoctor(doctorModel: e);
                                Navigator.of(context)
                                    .pushNamed('/online-ticket-schedule');
                              },
                            );
                          }).toList(),
                        ),
                  loading ? const CenterLoading() : const SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
