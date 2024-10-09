import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediflow_bloc/Models/online_ticket/billingmode_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/district_model.dart';
import 'package:mediflow_bloc/Models/online_ticket/municipality_model.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/gender_list.dart';
import 'package:mediflow_bloc/constant/regexp.dart';
import 'package:mediflow_bloc/logic/cubit/onlineticket/onlineticket_cubit.dart';
import 'package:mediflow_bloc/screens/online_ticket_screen/online_ticket_detail/online_ticket_age.dart';
import 'package:mediflow_bloc/widgets/button/main_button.dart';
import 'package:mediflow_bloc/widgets/center_loading/center_loading.dart';
import 'package:mediflow_bloc/widgets/form/custom_form_field.dart';
import 'package:mediflow_bloc/widgets/form/custom_form_label.dart';
import 'package:mediflow_bloc/widgets/form/custom_form_option.dart';

class OnlineTicketDetail extends StatefulWidget {
  const OnlineTicketDetail({super.key});

  @override
  State<OnlineTicketDetail> createState() => _OnlineTicketDetailState();
}

class _OnlineTicketDetailState extends State<OnlineTicketDetail> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController municipalityController = TextEditingController();
  @override
  void initState() {
    // reset previous insurance detail
    context.read<OnlineticketCubit>().resetInsureeDetail();
    context.read<OnlineticketCubit>().getDistrictAndMunicipality();
    super.initState();
  }

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    genderController.dispose();
    districtController.dispose();
    municipalityController.dispose();
    super.dispose();
  }

  submitForm() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('/online-ticket-payment');
    }
  }

  getInsureeDetail() {
    context.read<OnlineticketCubit>().getInsureeDetail();
  }

  @override
  Widget build(BuildContext context) {
    String gender = context.select((OnlineticketCubit e) => e.state.gender);
    List<DistrictModel> district =
        context.select((OnlineticketCubit e) => e.state.district);
    DistrictModel selectedDistrict =
        context.select((OnlineticketCubit e) => e.state.districtModel);
    List<MunicipalityModel> municipality =
        context.select((OnlineticketCubit e) => e.state.municipality);
    MunicipalityModel selectedMunicipality =
        context.select((OnlineticketCubit e) => e.state.municipalityModel);
    BillingModeModel billingModeModel =
        context.select((OnlineticketCubit e) => e.state.billingModeModel);
    bool loading = context.select((OnlineticketCubit e) => e.state.loading);
    bool isInsurance = billingModeModel.showPolicyNumber;
    genderController.text = gender;
    districtController.text = selectedDistrict.name;
    municipalityController.text = selectedMunicipality.name;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Detail'),
        centerTitle: true,
      ),
      body: BlocListener<OnlineticketCubit, OnlineticketState>(
        listener: (context, state) {
          if (state.insureeFetched) {
            fnameController.text = state.fname;
            lnameController.text = state.lname;
            genderController.text = state.gender;
          }
        },
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(kDefaultSpacing),
                children: [
                  isInsurance
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CustomFormLabel(
                              label: 'Policy number',
                              required: true,
                              verticalPadding: true,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomFormField(
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      context
                                          .read<OnlineticketCubit>()
                                          .changePolicyNumber(value);
                                    },
                                    validator: (value) {
                                      if ((value == null || value.isEmpty) &&
                                          isInsurance) {
                                        return 'Policy number is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: kSmallSpacing),
                                MainButton(
                                  title: 'Check',
                                  buttonBorderRadius:
                                      ButtonBorderRadius.extraSmall,
                                  onPressed: () {
                                    getInsureeDetail();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: kSmallSpacing),
                          ],
                        )
                      : const SizedBox(),
                  CustomFormLabel(
                    label: 'First Name',
                    required: !isInsurance,
                    verticalPadding: true,
                  ),
                  CustomFormField(
                    controller: fnameController,
                    textInputAction: TextInputAction.next,
                    readOnly: isInsurance,
                    onChanged: (value) {
                      context.read<OnlineticketCubit>().changeFname(value);
                    },
                    validator: (value) {
                      if ((value == null || value.isEmpty) && !isInsurance) {
                        return 'First name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: kSmallSpacing),
                  CustomFormLabel(
                    label: 'Last Name',
                    required: !isInsurance,
                    verticalPadding: true,
                  ),
                  CustomFormField(
                    controller: lnameController,
                    textInputAction: TextInputAction.next,
                    readOnly: isInsurance,
                    onChanged: (value) {
                      context.read<OnlineticketCubit>().changeLname(value);
                    },
                    validator: (value) {
                      if ((value == null || value.isEmpty) && !isInsurance) {
                        return 'Last name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: kSmallSpacing),
                  CustomFormLabel(
                    label: 'Age',
                    required: !isInsurance,
                    verticalPadding: true,
                  ),
                  OnlineTicketAge(
                    isInsurance: isInsurance,
                  ),
                  const SizedBox(height: kSmallSpacing),
                  const CustomFormLabel(
                    label: 'Mobile number',
                    required: true,
                    verticalPadding: true,
                  ),
                  CustomFormField(
                    prefixText: '+977 ',
                    maxLength: 10,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    suffixIcon: const Icon(Icons.phone_outlined),
                    onChanged: (value) {
                      context.read<OnlineticketCubit>().changePhone(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile number is required';
                      } else if (!phoneNumberRegexp.hasMatch(value)) {
                        return 'Enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: kSmallSpacing),
                  const CustomFormLabel(
                    label: 'Gender',
                    required: true,
                    verticalPadding: true,
                  ),
                  CustomFormOption(
                    disabled: isInsurance,
                    title: 'Gender',
                    controller: genderController,
                    list: kGenderList,
                    changeType: 'online-ticket-gender',
                  ),
                  const SizedBox(height: kSmallSpacing),
                  const CustomFormLabel(
                    label: 'District',
                    required: true,
                    verticalPadding: true,
                  ),
                  CustomFormOption(
                    title: 'District',
                    list: district,
                    controller: districtController,
                    changeType: 'online-ticket-district',
                  ),
                  const SizedBox(height: kSmallSpacing),
                  const CustomFormLabel(
                    label: 'Municipality',
                    required: true,
                    verticalPadding: true,
                  ),
                  CustomFormOption(
                    title: 'Municipality',
                    controller: municipalityController,
                    list: municipality,
                    changeType: 'online-ticket-municipality',
                  ),
                  const SizedBox(height: kSmallSpacing),
                  const CustomFormLabel(
                    label: 'Ward',
                    required: true,
                    verticalPadding: true,
                  ),
                  CustomFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ward number is required';
                      } else if (int.parse(value) == 0) {
                        return 'Ward cannot be zero (0)';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      context.read<OnlineticketCubit>().changeWard(value);
                    },
                    onEditingComplete: () {
                      submitForm();
                    },
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  MainButton(
                    title: 'Continue',
                    onPressed: () {
                      submitForm();
                    },
                  ),
                  const SizedBox(height: kLargeSpacing),
                ],
              ),
            ),
            loading ? const CenterLoading() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
