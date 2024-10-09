import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediflow_bloc/provider/ApiClass/APIService.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/widgets/Image%20Picker/bottomsheet.dart';
import 'package:mediflow_bloc/widgets/ProfileDashboards/userProfileImageWidget.dart';
import 'package:mediflow_bloc/widgets/customeTexts.dart';
import 'package:mediflow_bloc/widgets/form/custom_form_field.dart';
import 'package:provider/provider.dart';

import '../../widgets/button/profilebtns.dart';
import '../../widgets/validationTextFormField.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool visibleFirstNameTextFormField = false;
  bool visibleMiddleNameTextFormField = false;
  bool visibleLastNameTextFormField = false;
  bool visibleEmailTextFormField = false;
  bool visibleNumberTextFormField = false;

  @override
  Widget build(BuildContext context) {
    PatientsResponseLoginModels? patientData =
        context.watch<ApiService>().patientData;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0))),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20.0,
        ),
        const BottomSheetModel(),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
          child: Column(children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your User Id : ",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                ),
                Text(
                  patientData?.cemRno ?? "",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            // this is for firstname
            const SizedBox(
              height: 20.0,
            ),
            const CustomTexts(label: "Your First Name :"),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible: visibleFirstNameTextFormField,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      onSuffixPressed: () {
                        setState(() {
                          visibleFirstNameTextFormField =
                              !visibleFirstNameTextFormField;
                        });
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      label: "First Name",
                    ),
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible:
                        visibleFirstNameTextFormField == true ? false : true,
                    child: RegisterFields(
                      icon: Icons.brush,
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      readOnly: true,
                      onSuffixPressed: () {
                        setState(() {
                          visibleFirstNameTextFormField =
                              !visibleFirstNameTextFormField;
                        });
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      hintText: patientData?.srtfname ?? "",
                    ),
                  ),
                ),
              ],
            ),

            // this is for middle name

            Visibility(
              visible: patientData?.strMname == null ? false : true,
              child: const SizedBox(
                height: 10.0,
              ),
            ),
            Visibility(
                visible: patientData?.strMname == null ? false : true,
                child: const CustomTexts(label: "Your Middle Name :")),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible: patientData?.strMname == null ? false : true,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      onSuffixPressed: () {
                        setState(() {});
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      label: "Middle Name",
                    ),
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible: patientData?.strMname == null ? false : true,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      readOnly: true,
                      onSuffixPressed: () {
                        setState(() {});
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      hintText: patientData?.strMname ?? "",
                    ),
                  ),
                ),
              ],
            ),

            // this is for last name

            const CustomTexts(label: "Your Last Name :"),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible: visibleLastNameTextFormField,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      onSuffixPressed: () {
                        setState(() {
                          visibleLastNameTextFormField =
                              !visibleLastNameTextFormField;
                        });
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      label: "Last Name",
                    ),
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible:
                        visibleLastNameTextFormField == true ? false : true,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      readOnly: true,
                      onSuffixPressed: () {
                        setState(() {
                          visibleLastNameTextFormField =
                              !visibleLastNameTextFormField;
                        });
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      hintText: patientData?.strLname ?? "",
                    ),
                  ),
                ),
              ],
            ),
            // this is for email
            const SizedBox(
              height: 10.0,
            ),

            const CustomTexts(label: "Your Email :"),
            const SizedBox(
              height: 10.0,
            ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: RegisterFields(
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    readOnly: true,
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    hintText: patientData?.strEmail ?? "",
                  ),
                ),
              ],
            ),

            // this is for phone number
            const SizedBox(
              height: 10.0,
            ),
            const CustomTexts(label: "Your Phone Number :"),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible: visibleNumberTextFormField,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      onSuffixPressed: () {
                        setState(() {
                          visibleNumberTextFormField =
                              !visibleNumberTextFormField;
                        });
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      label: "Phone Number",
                    ),
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Visibility(
                    visible: visibleNumberTextFormField == true ? false : true,
                    child: RegisterFields(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      icon: Icons.brush,
                      readOnly: true,
                      onSuffixPressed: () {
                        setState(() {
                          visibleNumberTextFormField =
                              !visibleNumberTextFormField;
                        });
                      },
                      contentPadding: const EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      hintText: patientData?.intmobile ?? "",
                    ),
                  ),
                ),
              ],
            ),

            // this is for date of birth

            const SizedBox(
              height: 10.0,
            ),
            const CustomTexts(label: "Your Date of Birth :"),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: RegisterFields(
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    readOnly: true,
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    hintText: patientData?.dtmDob ?? "",
                  ),
                ),
              ],
            ),

            // this is for gender

            const SizedBox(
              height: 10.0,
            ),
            const CustomTexts(label: "Your Gender :"),
            const SizedBox(
              height: 10.0,
            ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: RegisterFields(
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    readOnly: true,
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    hintText: patientData?.strGender ?? "",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            )
          ]),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ]),
    );
  }

  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;

  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //       mainImage = File(image.path);
  //       print("this isss$mainImage");
  //     });
  //   } on PlatformException catch (e) {
  //     print("Failed to pick Image: $e");
  //   }
  // }
}
