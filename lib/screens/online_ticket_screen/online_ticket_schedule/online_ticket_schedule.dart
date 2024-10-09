import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/doctor_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/schedule_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_schedule/online_ticket_time/online_ticket_time.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/tile/doctor_tile.dart';
import 'package:mediflow_bloc/widgets/tile/schedule_slot_tile.dart';

class OnlineTicketSchedule extends StatefulWidget {
  const OnlineTicketSchedule({super.key});

  @override
  State<OnlineTicketSchedule> createState() => _OnlineTicketScheduleState();
}

class _OnlineTicketScheduleState extends State<OnlineTicketSchedule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    DoctorModel doctorModel =
        context.select((OnlineticketCubit e) => e.state.doctorModel);
    List<ScheduleModel> scheduleList =
        context.select((OnlineticketCubit e) => e.state.scheduleList);
    ScheduleModel selectedSchedule =
        context.select((OnlineticketCubit e) => e.state.scheduleModel);
    bool allDoctorMode =
        context.select((OnlineticketCubit e) => e.state.allDoctorMode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appoinment'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return context
              .read<OnlineticketCubit>()
              .selectDoctor(doctorModel: doctorModel);
        },
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(kDefaultSpacing),
                  color: kWhite,
                  child: DoctorTile(
                    doctorModel: doctorModel,
                    withoutHospital: allDoctorMode,
                    onTap: null,
                  ),
                ),
                const SizedBox(height: kDefaultSpacing),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kDefaultSpacing,
                    right: kDefaultSpacing,
                    bottom: kDefaultSpacing,
                  ),
                  child: SizedBox(
                    height: 60.0,
                    child: scheduleList.isEmpty
                        ? const Center(
                            child: Text(
                              'No Schedule Available',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: scheduleList.length,
                            itemBuilder: (context, index) {
                              return ScheduleSlotTile(
                                isSelected: selectedSchedule.id ==
                                    scheduleList[index].id,
                                scheduleModel: scheduleList[index],
                                onTap: () {
                                  context
                                      .read<OnlineticketCubit>()
                                      .selectSchedule(scheduleList[index]);
                                },
                              );
                            },
                          ),
                  ),
                ),
                scheduleList.isEmpty
                    ? const SizedBox.shrink()
                    : const OnlineTicketTime(),
              ],
            ),
            loading ? const CenterLoading() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
