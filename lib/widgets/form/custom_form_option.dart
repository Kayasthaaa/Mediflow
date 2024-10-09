// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/widgets/form/custom_form_field.dart';

class CustomFormOption extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final List<dynamic> list;
  final String changeType;
  final bool disabled;
  const CustomFormOption({
    Key? key,
    required this.title,
    required this.changeType,
    required this.list,
    required this.controller,
    this.disabled = false,
  }) : super(key: key);

  getName(dynamic value) {
    if (changeType == 'online-ticket-gender') {
      return value;
    } else if (changeType == 'online-ticket-district') {
      return value.name;
    } else if (changeType == 'online-ticket-municipality') {
      return value.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedValue = controller.text;
    bool isSelected(dynamic value) {
      if (changeType == 'online-ticket-gender') {
        return selectedValue == value;
      } else if (changeType == 'online-ticket-district') {
        return selectedValue == value.name;
      } else if (changeType == 'online-ticket-municipality') {
        return selectedValue == value.name;
      } else {
        return false;
      }
    }

    return CustomFormField(
      controller: controller,
      readOnly: true,
      suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
      onTap: () {
        FocusScope.of(context).unfocus();
        if (disabled) {
          return;
        }
        showDialog(
            context: context,
            builder: (context) {
              String query = '';
              return StatefulBuilder(
                builder: ((context, setState) {
                  List<dynamic> filteredList = [];
                  if (query == '') {
                    filteredList = list;
                  } else {
                    if (changeType == 'online-ticket-gender') {
                      filteredList = list
                          .where((e) => e.toLowerCase().trim().contains(query))
                          .toList();
                    } else if (changeType == 'online-ticket-district') {
                      filteredList = list
                          .where((e) =>
                              e.name.toLowerCase().trim().contains(query))
                          .toList();
                    } else if (changeType == 'online-ticket-municipality') {
                      filteredList = list
                          .where((e) =>
                              e.name.toLowerCase().trim().contains(query))
                          .toList();
                    } else {
                      filteredList = list;
                    }
                  }
                  return AlertDialog(
                    title: Text(title),
                    content: SizedBox(
                      height: 200.0,
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          CustomFormField(
                            hintText: 'Search',
                            onChanged: (value) {
                              setState(() {
                                query = value;
                              });
                            },
                          ),
                          Expanded(
                            child: filteredList.isEmpty
                                ? const Center(
                                    child: Text(
                                      'Nothing found',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : ListView(
                                    shrinkWrap: true,
                                    children: filteredList.map((e) {
                                      return ListTile(
                                        title: Text(
                                          getName(e),
                                          style: TextStyle(
                                            color: isSelected(e) ? kBlue : null,
                                          ),
                                        ),
                                        onTap: () {
                                          if (changeType ==
                                              'online-ticket-gender') {
                                            context
                                                .read<OnlineticketCubit>()
                                                .changeGender(e);
                                          } else if (changeType ==
                                              'online-ticket-district') {
                                            context
                                                .read<OnlineticketCubit>()
                                                .changeDistrict(e);
                                          } else if (changeType ==
                                              'online-ticket-municipality') {
                                            context
                                                .read<OnlineticketCubit>()
                                                .changeMunicipality(e);
                                          }
                                          Navigator.pop(context);
                                        },
                                      );
                                    }).toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Okay'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                }),
              );
            });
      },
    );
  }
}
