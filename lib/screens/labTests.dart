import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/widgets/DasboardWidgets/LabContainer.dart';
import 'package:mediflow_bloc/widgets/customeTexts.dart';

import '../widgets/DasboardWidgets/dashboardWidgets.dart';

class Labtest extends StatelessWidget {
  const Labtest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Lab Tests"),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 30.0,
        ),
        MediaContainer(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: const Color.fromRGBO(0, 0, 0, 0)),
          height: 150.0,
          child: Image.asset(
            "images/media.png",
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 17.0,
        ),
        const CustomTexts(
          label: "Popular Health Packages",
        ),
        const SizedBox(
          height: 17.0,
        ),
        MediaContainer(
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(7.0)),
              ),
            ),
            const VerticalDivider(width: 12.0),
            Expanded(
              child: Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(7.0)),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 17.0,
        ),
        MediaContainer(
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(7.0)),
              ),
            ),
            const VerticalDivider(width: 12.0),
            Expanded(
              child: Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(7.0)),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 17.0,
        ),
        MediaContainer(
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          height: 30.0,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Booked Diagnostic Tests",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold))),
              Text("See All",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent)))
            ],
          ),
        ),
        const SizedBox(
          height: 17.0,
        ),
        MediaContainer(
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: LabContainer(
                    onTap: () => print("first"),
                    color: Colors.green,
                    header: "Fasting Blood Sugar",
                    body: "Measuring fasting blood sugar levels",
                    footer: "Reports on next day Rs 100.00"),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: LabContainer(
                    onTap: () => print("second"),
                    color: Colors.pink,
                    header: "Vitamin B 12",
                    body: "vitamin B-12 deficiency use of this supplement",
                    footer: "Reports on next day Rs 300.00"),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: LabContainer(
                    // ignore: avoid_returning_null_for_void
                    onTap: () => print("third"),
                    color: Colors.deepPurple,
                    header: "BETA HCG",
                    body: "A quantitative human chorionic gonadotropin",
                    footer: "Reports on next day Rs 1000.00"),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30.0,
        )
      ]),
    );
  }
}
