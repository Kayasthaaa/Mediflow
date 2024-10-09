import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/widgets/DasboardWidgets/DocumentCategory.dart';
import 'package:mediflow_bloc/widgets/DasboardWidgets/Headings.dart';
import 'package:mediflow_bloc/widgets/DasboardWidgets/UtilitiesWidgets.dart';
import 'package:mediflow_bloc/widgets/DasboardWidgets/dashboardWidgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/ApiClass/APIService.dart';
import '../widgets/DasboardWidgets/dasboardButtons.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientsResponseLoginModels? patientData =
        context.watch<ApiService>().patientData;
    DoctorResponseLoginModels? doctorData =
        context.watch<ApiService>().doctorData;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: SizedBox(
          width: size.width,
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                    width: 155.0,
                    child: Image.asset(
                      "images/Logo.png",
                      fit: BoxFit.fill,
                    )),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    height: 55.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 30,
                              child: InkWell(
                                onTap: (() => launchUrl(Uri.parse(
                                    'https://mediflowsolution.com/About/privacypolicy'))),
                                child: Image.asset(
                                  "images/notofication.png",
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          SizedBox(
                              height: 30,
                              child: InkWell(
                                onTap: (() => launchUrl(Uri.parse(
                                    'https://mediflowsolution.com/About/privacypolicy'))),
                                child: Image.asset(
                                  "images/help.png",
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
      body: (ListView(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          MediaContainer(
            margin: const EdgeInsets.symmetric(horizontal: 22.0),
            color: Colors.transparent,
            child: Row(children: [
              Text("Welcome,",
                  style: GoogleFonts.lato(
                      textStyle: (const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.green)))),
              const SizedBox(
                width: 5.0,
              ),
              patientData?.cemRno == null
                  ? Row(
                      children: [
                        Text("Doctor ",
                            style: GoogleFonts.lato(
                                textStyle: (const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: Colors.green)))),
                        Text(doctorData?.doctorName ?? "",
                            style: GoogleFonts.lato(
                                textStyle: (const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: Colors.green)))),
                      ],
                    )
                  : Text(patientData?.srtfname ?? "",
                      style: GoogleFonts.lato(
                          textStyle: (const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.green))))
            ]),
          ),
          const SizedBox(
            height: 15.0,
          ),
          MediaContainer(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.transparent),
            height: 141.0,
            child: Image.asset(
              "images/media.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          MediaContainer(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.transparent),
            height: 170.0,
            child: Stack(children: [
              Positioned.fill(
                child: Image.asset(
                  "images/bookAppointment.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  left: 19.0,
                  bottom: 33.0,
                  child: BookAppointmentBtns(
                    label: "Book Appointment",
                    onTap: (() =>
                        Navigator.pushNamed(context, '/online-ticket-screen')),
                  ))
            ]),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Headings(
            label: "My Documents",
            imageIcon: AssetImage("images/documents.png"),
          ),
          const SizedBox(
            height: 2.0,
          ),
          const Grids(
            height: 290.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          MediaContainer(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0), color: Colors.pink),
            height: 141.0,
            child: Image.asset(
              "images/media.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Headings(
            label: "Utilities",
            imageIcon: AssetImage("images/documents.png"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Utilities(),
          const SizedBox(
            height: 30.0,
          ),
        ],
      )),
    );
  }
}
