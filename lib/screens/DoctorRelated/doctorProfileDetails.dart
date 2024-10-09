import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/widgets/validationTextFormField.dart';

import '../../provider/ApiClass/APIService.dart';
import '../../widgets/ProfileDashboards/userProfileImageWidget.dart';
import '../../widgets/customeTexts.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  // bool visibleFirstNameTextFormField = false;
  // bool visibleMiddleNameTextFormField = false;
  // bool visibleLastNameTextFormField = false;
  // bool visibleEmailTextFormField = false;
  // bool visibleNumberTextFormField = false;
  @override
  Widget build(BuildContext context) {
    DoctorResponseLoginModels? doctorData =
        context.watch<ApiService>().doctorData;
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
          height: 40.0,
        ),
        const MyImages(
          label: 'Change Image',
          icon: Icons.brush,
        ),
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
                  "Your Username : ",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                ),
                Text(
                  doctorData?.nmCno ?? "",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            // this is for name
            const SizedBox(
              height: 20.0,
            ),
            const CustomTexts(label: "Your Name :"),
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
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    label: "First Name",
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
                    hintText: doctorData?.emailId ?? "",
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
                  child: RegisterFields(
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    label: "Phone Number",
                  ),
                ),
              ],
            ),

            // this is for date of birth

            const SizedBox(
              height: 10.0,
            ),
            const CustomTexts(label: "Your Current Address:"),
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
                    hintText: doctorData?.currentAddress ?? "",
                  ),
                ),
              ],
            ),

            // this is for gender

            const SizedBox(
              height: 10.0,
            ),
            const CustomTexts(label: "Your Qualification :"),
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
                    hintText: doctorData?.profile ?? "",
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
}
