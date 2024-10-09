import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/constant/age_one_list.dart';
import 'package:mediflow_bloc/constant/age_two_list.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/form/custom_form_field.dart';

class OnlineTicketAge extends StatefulWidget {
  final bool isInsurance;
  const OnlineTicketAge({
    super.key,
    required this.isInsurance,
  });

  @override
  State<OnlineTicketAge> createState() => _OnlineTicketAgeState();
}

class _OnlineTicketAgeState extends State<OnlineTicketAge> {
  TextEditingController ageOneController = TextEditingController();
  @override
  void dispose() {
    ageOneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String ageLabelOne =
        context.select((OnlineticketCubit e) => e.state.ageLabelOne);
    String ageLabelTwo =
        context.select((OnlineticketCubit e) => e.state.ageLabelTwo);
    return BlocListener<OnlineticketCubit, OnlineticketState>(
      listener: (context, state) {
        if (state.insureeFetched) {
          ageOneController.text = state.ageOne.toString();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomFormField(
              controller: ageOneController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              readOnly: widget.isInsurance,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if ((value == null || value.isEmpty) && !widget.isInsurance) {
                  return 'Required';
                }
                return null;
              },
              onChanged: (value) {
                context.read<OnlineticketCubit>().changeAgeOne(value);
              },
            ),
          ),
          const SizedBox(width: kExtraSmallSpacing),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
                border: Border.all(
                  color: kOnBackground.withAlpha(50),
                ),
              ),
              child: DropdownButton(
                isExpanded: true,
                value: ageLabelOne,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(kSmallBorderRadius),
                icon: const SizedBox.shrink(),
                items: kAgeOneList.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Center(child: Text(e)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<OnlineticketCubit>().changeAgeLabelOne(value);
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: kExtraSmallSpacing),
          Expanded(
            child: CustomFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              readOnly: widget.isInsurance,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                context.read<OnlineticketCubit>().changeAgeTwo(value);
              },
            ),
          ),
          const SizedBox(width: kExtraSmallSpacing),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
                border: Border.all(
                  color: kOnBackground.withAlpha(50),
                ),
              ),
              child: DropdownButton(
                isExpanded: true,
                value: ageLabelTwo,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(kSmallBorderRadius),
                icon: const SizedBox.shrink(),
                items: kAgeTwoList.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Center(child: Text(e)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<OnlineticketCubit>().changeAgeLabelTwo(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
