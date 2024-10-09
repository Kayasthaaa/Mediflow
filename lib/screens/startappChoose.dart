import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/provider/ApiClass/APIService.dart';

class ChooseLogin extends StatefulWidget {
  const ChooseLogin({Key? key}) : super(key: key);

  @override
  _ChooseLoginState createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
  @override
  void initState() {
    super.initState();
    GlobalToken().globalTokenGeneration();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(
              height: 90.0,
            ),
            SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Choose Your Account Type",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: size.width * 0.057,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/patient-login");
                    },
                    child: Image.asset("images/choosePatient.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/doctor-login");
                    },
                    child: Image.asset("images/chooseDoctor.png")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
