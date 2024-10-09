import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/department_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/scaffold/search_list_scaffold.dart';
import 'package:mediflow_bloc/widgets/ticket_billingmode/ticket_billingmode.dart';

class OnlineTicketAllDepartment extends StatelessWidget {
  const OnlineTicketAllDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    List<DepartmentModel> departmentList = context
        .select((OnlineticketCubit e) => e.state.departmentSearchListForDoctor);
    List<BillingModeModel> billingModeList =
        context.select((OnlineticketCubit e) => e.state.billingModeList);
    BillingModeModel selectedBillingMode =
        context.select((OnlineticketCubit e) => e.state.billingModeModel);
    return SearchListScaffold(
      title: 'Department List',
      onQueryChanged: (value) {
        context.read<OnlineticketCubit>().changeDepartmentForDoctorQuery(value);
      },
      child: RefreshIndicator(
        onRefresh: () {
          return context
              .read<OnlineticketCubit>()
              .getDepartmentListForDoctor(isRefresh: true);
        },
        child: Stack(
          children: [
            departmentList.isEmpty && !loading
                ? ListView(
                    children: const [
                      SizedBox(height: kLargeSpacing),
                      Text(
                        'No Department Found',
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
                    children: <Widget>[
                          TicketBillingMode(
                            billingModeList: billingModeList,
                            selectedBillingMode: selectedBillingMode,
                          ),
                        ] +
                        departmentList.map((e) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: kSmallSpacing),
                            child: Material(
                              color: kWhite,
                              elevation: 1.0,
                              shadowColor: kShadowColor,
                              borderRadius:
                                  BorderRadius.circular(kSmallBorderRadius),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<OnlineticketCubit>()
                                      .selectDoctor(
                                        departmentId: e.id,
                                      );
                                  Navigator.of(context)
                                      .pushNamed('/online-ticket-schedule');
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(kDefaultSpacing),
                                  child: Text(e.name),
                                ),
                              ),
                            ),
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
