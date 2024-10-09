import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/schedule_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/services/date_formatter.dart';
import 'package:mediflow_bloc/widgets/button/main_button.dart';

class OnlineTicketTime extends StatefulWidget {
  const OnlineTicketTime({super.key});

  @override
  State<OnlineTicketTime> createState() => _OnlineTicketTimeState();
}

class _OnlineTicketTimeState extends State<OnlineTicketTime> {
  int? selectedTimeSlot;
  @override
  Widget build(BuildContext context) {
    ScheduleModel scheduleModel =
        context.select((OnlineticketCubit e) => e.state.scheduleModel);
    List<String> availableTime = [];
    if (selectedTimeSlot != null) {
      availableTime = [];
      if (selectedTimeSlot == 0) {
        availableTime = context
            .select((OnlineticketCubit e) => e.state.availableTime)
            .where((e) {
          List<String> split = e.split(':').toList();
          TimeOfDay timeOfDay = TimeOfDay(
            hour: int.parse(split[0]),
            minute: int.parse(split[1]),
          );
          return timeOfDay.period == DayPeriod.am;
        }).toList();
      } else {
        availableTime = context
            .select((OnlineticketCubit e) => e.state.availableTime)
            .where((e) {
          List<String> split = e.split(':').toList();
          TimeOfDay timeOfDay = TimeOfDay(
            hour: int.parse(split[0]),
            minute: int.parse(split[1]),
          );
          return timeOfDay.period == DayPeriod.pm;
        }).toList();
      }
    }
    String selectedTime =
        context.select((OnlineticketCubit e) => e.state.selectedTime);

    return Container(
      padding: const EdgeInsets.all(kDefaultSpacing),
      color: kWhite,
      child: scheduleModel.id == 0
          ? const Text(
              'Select date first',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          : scheduleModel.quota == 0
              ? const Text(
                  'No Quota Available for Selected Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      CustomDateFormatter.longScheduleDateFormatter(
                        scheduleModel.date,
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: kSmallSpacing),
                    Row(
                      children: [
                        Expanded(
                          child: FilterChip(
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: kBlue),
                            backgroundColor: Colors.transparent,
                            selectedColor: kBlue,
                            showCheckmark: false,
                            labelStyle: TextStyle(
                              color: selectedTimeSlot == 0 ? kWhite : null,
                            ),
                            selected: selectedTimeSlot == 0,
                            label: Row(
                              children: [
                                Icon(Icons.sunny,
                                    color:
                                        selectedTimeSlot == 0 ? kWhite : null),
                                const Text('Morning'),
                              ],
                            ),
                            onSelected: (value) {
                              if (value) {
                                setState(() {
                                  context
                                      .read<OnlineticketCubit>()
                                      .changeSelectedTime('');
                                  selectedTimeSlot = 0;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: kSmallSpacing),
                        Expanded(
                          child: FilterChip(
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: kBlue),
                            backgroundColor: Colors.transparent,
                            selectedColor: kBlue,
                            showCheckmark: false,
                            labelStyle: TextStyle(
                              color: selectedTimeSlot == 1 ? kWhite : null,
                            ),
                            selected: selectedTimeSlot == 1,
                            label: Row(
                              children: [
                                Icon(Icons.light,
                                    color:
                                        selectedTimeSlot == 1 ? kWhite : null),
                                const Text('Evening'),
                              ],
                            ),
                            onSelected: (value) {
                              if (value) {
                                setState(() {
                                  context
                                      .read<OnlineticketCubit>()
                                      .changeSelectedTime('');
                                  selectedTimeSlot = 1;
                                });
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: kSmallSpacing),
                    selectedTimeSlot == null
                        ? const SizedBox.shrink()
                        : const Text('Choose the hour'),
                    const SizedBox(height: kSmallSpacing),
                    Align(
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: kExtraSmallSpacing,
                        children: availableTime.map((e) {
                          List<String> split = e.split(':').toList();
                          TimeOfDay timeOfDay = TimeOfDay(
                            hour: int.parse(split[0]),
                            minute: int.parse(split[1]),
                          );
                          return FilterChip(
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: kBlue),
                            backgroundColor: kBackground,
                            selectedColor: kBlue,
                            showCheckmark: false,
                            labelStyle: TextStyle(
                              color: e == selectedTime ? kWhite : null,
                            ),
                            selected: e == selectedTime,
                            label: Text(timeOfDay.format(context)),
                            onSelected: (value) {
                              if (value) {
                                context
                                    .read<OnlineticketCubit>()
                                    .changeSelectedTime(e);
                              }
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    availableTime.isEmpty || selectedTime.isEmpty
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(top: kLargeSpacing),
                            child: MainButton(
                              title: 'Continue',
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/online-ticket-detail');
                              },
                            ),
                          ),
                  ],
                ),
    );
  }
}
