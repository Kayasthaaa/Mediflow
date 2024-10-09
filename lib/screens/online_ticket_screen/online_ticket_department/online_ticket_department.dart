import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/department_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/scaffold/search_list_scaffold.dart';

class OnlineTicketDepartment extends StatelessWidget {
  const OnlineTicketDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    List<DepartmentModel> departmentList =
        context.select((OnlineticketCubit e) => e.state.departmentSearchList);
    return SearchListScaffold(
      title: 'Department List',
      onQueryChanged: (value) {
        context.read<OnlineticketCubit>().changeDepartmentQuery(value);
      },
      child: RefreshIndicator(
        onRefresh: () {
          return context.read<OnlineticketCubit>().getDepartment(
                context.read<OnlineticketCubit>().state.companyId,
              );
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
                    children: departmentList.map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: kSmallSpacing),
                        child: Material(
                          color: kWhite,
                          elevation: 1.0,
                          shadowColor: kShadowColor,
                          borderRadius:
                              BorderRadius.circular(kSmallBorderRadius),
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                              context.read<OnlineticketCubit>().getDoctor(e.id);
                              Navigator.of(context)
                                  .pushNamed('/online-ticket-doctor');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(kDefaultSpacing),
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
