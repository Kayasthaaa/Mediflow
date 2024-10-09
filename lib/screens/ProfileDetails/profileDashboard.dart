import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mediflow_bloc/provider/ApiClass/APIService.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/screens/startappChoose.dart';
import 'package:mediflow_bloc/widgets/ProfileDashboards/profileDetailsWidgets.dart';
import 'package:mediflow_bloc/widgets/ProfileDashboards/profileFeatures.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientsResponseLoginModels? patientData =
        context.watch<ApiService>().patientData;
    DoctorResponseLoginModels? doctorData =
        context.watch<ApiService>().doctorData;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          patientData?.cemRno == null
              ? UserDetails(
                  widget: Image.asset("images/documents.png"),
                  username: doctorData?.doctorName ?? "",
                  email: doctorData?.emailId ?? "",
                  number: doctorData?.contactNo ?? "",
                  onTap: (() =>
                      Navigator.pushNamed(context, "/doctor-profile-details")),
                )
              : UserDetails(
                  widget: Image.asset("images/documents.png"),
                  username: patientData?.srtfname ?? "",
                  email: patientData?.strEmail ?? "",
                  number: patientData?.intmobile ?? "",
                  lastname: patientData?.strLname ?? "",
                  onTap: (() =>
                      Navigator.pushNamed(context, "/user-profile-details")),
                ),
          const SizedBox(
            height: 30.0,
          ),
          Features(
            icons: Icons.arrow_back_ios_new,
            label: 'Notifications',
            widget: Image.asset("images/notofication.png"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Features(
            icons: Icons.arrow_back_ios_new,
            label: 'My Appointments',
            widget: Image.asset("images/notofication.png"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Features(
            icons: Icons.arrow_back_ios_new,
            label: 'Invite Friends',
            widget: Image.asset("images/notofication.png"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Features(
            icons: Icons.arrow_back_ios_new,
            label: 'Documents',
            widget: Image.asset("images/notofication.png"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Consumer<ApiService>(
              builder: (BuildContext context, providerValue, child) {
            return Features(
                icons: Icons.arrow_back_ios_new,
                label: 'Logout',
                widget: Image.asset("images/logout.png"),
                onTap: () async {
                  EasyLoading.dismiss();
                  EasyLoading.showInfo("Logging Out");
                  SharedPreferences sharedpreferences =
                      await SharedPreferences.getInstance();
                  for (String key in sharedpreferences.getKeys()) {
                    if (key != "DcotorUsername" &&
                        key != "rememberMe" &&
                        key != "DoctorPassword" &&
                        key != "uniqueIdRemember" &&
                        key != "remember_me" &&
                        key != "passwordRemember") {
                      sharedpreferences.remove(key);
                    }
                    // ignore: use_build_context_synchronously
                    providerValue.disposeValuesProviders();
                    EasyLoading.dismiss();
                    EasyLoading.showSuccess("Logged Out");
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseLogin()));
                  }
                });
          }),
          const SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
