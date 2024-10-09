import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mediflow_bloc/screens/PatientLogins/patientRegister.dart';
import 'package:mediflow_bloc/screens/startappChoose.dart';
import 'package:mediflow_bloc/widgets/LoginPageWidgets.dart';
import 'package:mediflow_bloc/widgets/myButtons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/ApiClass/APIService.dart';
import '../../Models/ModelClass.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({Key? key}) : super(key: key);

  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  @override
  void initState() {
    _rememberMe();
    super.initState();
  }

  bool _isChecked = false;
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  String? code, username, password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Positioned(
            left: -105,
            top: -28,
            child: SizedBox(
              width: size.width,
              child: Image.asset("images/loginP.png"),
            ),
          ),
          Positioned(
            left: 15,
            top: 40,
            child: (IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseLogin()));
              },
            )),
          ),
          Positioned(
            bottom: -260,
            right: -360,
            child: Image.asset("images/patient.png"),
          ),
          Positioned(
            top: 203.0,
            left: 20,
            child: Container(
              width: size.width / 2,
              color: Colors.transparent,
              child: Text(
                "Welcome Back!",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: size.width * 0.06)),
              ),
            ),
          ),
          Positioned(
            top: 238.0,
            left: 20,
            child: Container(
              width: size.width,
              color: Colors.transparent,
              child: Text(
                "Sign in to continue",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: size.width * 0.055)),
              ),
            ),
          ),
          Positioned(
              top: 290.0,
              right: 20.0,
              left: 20.0,
              child: Card(
                elevation: 15.0,
                shadowColor: Colors.blue,
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      LoginWidgets(
                        controller: _emailController,
                        onChanged: (String value) {
                          username = value;
                        },
                        onSaved: (input) => username = input,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Required';
                          } else if (text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                            return 'Invalid Input';
                          }
                          return null;
                        },
                        icon: Icons.mail,
                        label: "Username",
                      ),
                      LoginWidgets(
                        controller: _passwordController,
                        onChanged: (String value) {
                          password = value;
                        },
                        onSaved: (input) => password = input,
                        keyboardType: TextInputType.visiblePassword,
                        iconSuffix: hidePassword == true
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        onSuffixPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        obscureText: hidePassword,
                        label: "Password",
                        icon: Icons.lock,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: size.width,
                        color: Colors.transparent,
                        margin: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(children: [
                          Checkbox(
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            activeColor: Colors.blue,
                            value: _isChecked,
                          ),
                          Text(
                            "Remember Me",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 16.0, color: Colors.black)),
                          ),
                        ]),
                      ),
                      const SizedBox(),
                      Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 18.0),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Text(
                              "Don't Have an Account?",
                              style: GoogleFonts.roboto(),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/patient-register");
                              },
                              child: Text("Create Here",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Mybuttons(
                        onpressed: () {
                          _saveForm();
                        },
                        color: Colors.blue,
                        label: "Sign In",
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ]),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future _saveForm() async {
    final isValid = _formKey.currentState?.validate();
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      if (!isValid!) {
        return;
      } else {
        EasyLoading.dismiss();
        EasyLoading.show(status: "Loading");
        // ignore: use_build_context_synchronously
        await context
            .read<ApiService>()
            .patientLogin(PatientsRequestLoginModels(
              code: "cemr".toString().trim(),
              username: username == null
                  ? _emailController.text.toString()
                  : username.toString().trim(),
              password: password == null
                  ? _passwordController.text.toString()
                  : password.toString().trim(),
            ));
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var patientCode = sharedPreferences.getInt("patientCode");

        if (patientCode == 200) {
          if (_isChecked == true) {
            SharedPreferences.getInstance().then((prefs) {
              prefs.setBool("remember_me", _isChecked);
              prefs.setString("uniqueIdRemember", _emailController.text);
              prefs.setString("passwordRemember", _passwordController.text);
            });
          }
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Welcome");
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, "/bottom-navigation");
        } else {
          EasyLoading.dismiss();
          EasyLoading.showInfo("Wrong Credentials, Please try Again");
        }
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.info,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'No Internet Connection',
                style:
                    GoogleFonts.lato(textStyle: const TextStyle(fontSize: 17)),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          margin: const EdgeInsets.only(bottom: 20, left: 22, right: 22),
        ),
      );
    }
  }

  _rememberMe() async {
    var prefs = await SharedPreferences.getInstance();
    _emailController.text = (prefs.getString("uniqueIdRemember")) ?? "";
    _passwordController.text = (prefs.getString("passwordRemember")) ?? "";
  }
}
