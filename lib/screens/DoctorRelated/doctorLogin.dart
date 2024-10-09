import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/screens/startappChoose.dart';
import 'package:mediflow_bloc/widgets/LoginPageWidgets.dart';
import 'package:mediflow_bloc/widgets/myButtons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/ApiClass/APIService.dart';
import '../../Models/ModelClass.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _rememberMeBox();
  }

  bool _isChecked = false;
  bool hidePassword = true;
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
              child: Image.asset("images/loginDoctor.png"),
            ),
          ),
          // ignore: prefer_const_constructors
          Positioned(
            left: 15,
            top: 40,
            child: (IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    (MaterialPageRoute(
                        builder: ((context) => const ChooseLogin()))));
              },
            )),
          ),
          Positioned(
            bottom: -270,
            right: -360,
            child: Image.asset("images/doctorLogin.png"),
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
              child: Form(
                key: _formkey,
                child: Card(
                  elevation: 15.0,
                  shadowColor: Colors.deepPurple,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0)),
                  child: Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      LoginWidgets(
                        controller: _emailController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Required';
                          } else if (text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                            return 'Invalid Input';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          username = value;
                        },
                        onSaved: (input) => username = input,
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.mail,
                        label: "Username",
                      ),
                      LoginWidgets(
                        controller: _passwordController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          password = value;
                        },
                        onSaved: (input) => password = input,
                        obscureText: hidePassword,
                        iconSuffix: hidePassword == true
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_sharp,
                        onSuffixPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        label: "Password",
                        icon: Icons.lock,
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
                                print("This os $value");
                              });
                            },
                            activeColor: Colors.deepPurple,
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
                      const SizedBox(
                        height: 9.0,
                      ),
                      Mybuttons(
                          onpressed: (() => _saveForm()),
                          color: Colors.deepPurple,
                          label: "Sign In"),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ]),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future _saveForm() async {
    final isValid = _formkey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      EasyLoading.dismiss();
      EasyLoading.show(status: "Loading");
      if (_isChecked == true) {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool("rememberMe", _isChecked);
          prefs.setString("DcotorUsername", _emailController.text);
          prefs.setString("DoctorPassword", _passwordController.text);
        });
      }
      var response = await context.read<ApiService>().register(
          DoctorRequestLoginModels(
              username: username == null
                  ? _emailController.text.toString()
                  : username.toString().trim(),
              password: password == null
                  ? _passwordController.text.toString()
                  : password.toString().trim(),
              code: "nmc".toString().trim()));
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var getCode = sharedPreferences.getInt("code");
      if (getCode == 200) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Welcome");
        Navigator.pushReplacementNamed(context, "/bottom-navigation");
      } else {
        EasyLoading.dismiss();
        EasyLoading.showInfo("Wrong Credentials, Please try Again");
      }
    }
  }

  _rememberMeBox() async {
    var prefs = await SharedPreferences.getInstance();
    _emailController.text = (prefs.getString("DcotorUsername")) ?? "";
    _passwordController.text = (prefs.getString("DoctorPassword")) ?? "";
  }
}
