import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/hospital_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/scaffold/search_list_scaffold.dart';
import 'package:mediflow_bloc/widgets/tile/hospital_tile.dart';

class OnlineTicketAllCompany extends StatelessWidget {
  const OnlineTicketAllCompany({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    List<HospitalModel> hospitalList =
        context.select((OnlineticketCubit e) => e.state.hospitalListForDoctor);
    return SearchListScaffold(
      title: 'Hospital List',
      onQueryChanged: (value) {
        context.read<OnlineticketCubit>().changeHospitalForDoctorQuery(value);
      },
      child: RefreshIndicator(
        onRefresh: () {
          return context
              .read<OnlineticketCubit>()
              .getCompanyListForDoctor(isRefresh: true);
        },
        child: Stack(
          children: [
            hospitalList.isEmpty && !loading
                ? ListView(
                    children: const [
                      SizedBox(height: kLargeSpacing),
                      Text(
                        'No Hospital Found',
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
                    children: hospitalList.map((e) {
                      return HospitalTile(
                        hospitalModel: e,
                        onTap: () {
                          context
                              .read<OnlineticketCubit>()
                              .getDepartmentListForDoctor(
                                companyId: e.id,
                                isRefresh: false,
                              );
                          Navigator.of(context).pushNamed(
                              '/online-ticket-all-department-for-doctor');
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
