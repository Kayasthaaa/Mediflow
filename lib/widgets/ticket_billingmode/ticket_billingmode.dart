import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/ticket_billingmode/ticket_billingmode_tile.dart';

class TicketBillingMode extends StatelessWidget {
  final BillingModeModel selectedBillingMode;
  final List<BillingModeModel> billingModeList;
  const TicketBillingMode({
    super.key,
    required this.selectedBillingMode,
    required this.billingModeList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultSpacing,
        right: kDefaultSpacing,
        bottom: kDefaultSpacing,
      ),
      child: SizedBox(
        height: 40.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: billingModeList.length,
          itemBuilder: (context, index) {
            return TicketBillingModeTile(
              isSelected: selectedBillingMode.id == billingModeList[index].id,
              billingModeModel: billingModeList[index],
              onTap: () {
                context
                    .read<OnlineticketCubit>()
                    .changeBillingMode(billingModeList[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
