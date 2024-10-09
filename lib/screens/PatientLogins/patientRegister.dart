import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/constant/app_url.dart';
import 'package:mediflow_bloc/provider/ApiClass/APIService.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/widgets/validationTextFormField.dart';
import 'dart:io' show Platform;
import '../../widgets/myButtons.dart';

class PatientRegister extends StatefulWidget {
  const PatientRegister({Key? key}) : super(key: key);

  @override
  _PatientRegisterState createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  bool hidePassword = true;
  String radioButtonItem = 'ONE';
  int id = 3;
  String? password,
      srtfname,
      strMname,
      strLname,
      strGender,
      strEmail,
      intmobile,
      deviceIdentity;
  int? District;

  DateTime? dtmDOB;
  List districtItemList = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchDistrictDropDown();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: Text(
              "Register User",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Form(
            key: _formKey,
            child: Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 22.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Fill in all the details",
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 19.0, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RegisterFields(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        contentPadding: const EdgeInsets.all(22.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        onChanged: (String value) {
                          srtfname = value;
                        },
                        onsaved: (input) => srtfname = input,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Required';
                          } else if (text.contains(RegExp(r'[0-9]')) ||
                              text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                            return 'Invalid Input';
                          }
                          return null;
                        },
                        label: "First Name"), // this is textfiled for firstname
                    const SizedBox(
                      height: 13.0,
                    ),
                    RegisterFields(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      contentPadding: const EdgeInsets.all(22.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onChanged: (String value) {
                        strMname = value;
                      },
                      onsaved: (input) => strMname = input,
                      label: "Middle Name",
                    ), // this is textfiled for middleName
                    const SizedBox(
                      height: 13.0,
                    ),
                    RegisterFields(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        contentPadding: const EdgeInsets.all(22.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        onChanged: (String value) {
                          strLname = value;
                        },
                        onsaved: (input) => strLname = input,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Required';
                          } else if (text.contains(RegExp(r'[0-9]')) ||
                              text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                            return 'Invalid Input';
                          }
                          return null;
                        },
                        label: "Last Name"), // this is textfiled for lastname
                    const SizedBox(
                      height: 13.0,
                    ),
                    RegisterFields(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        onChanged: (String value) {
                          intmobile = value;
                        },
                        contentPadding: const EdgeInsets.all(22.0),
                        onsaved: (input) => intmobile = input,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Required';
                          } else if (text.contains(RegExp(r'[a-z]')) ||
                              text.contains(RegExp(r'[A-Z]')) ||
                              text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                            return 'Invalid Input';
                          } else if (text.length < 10) {
                            return "Number Should not be less than 10";
                          } else if (text.length > 10) {
                            return "Number Should not be more than 10";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        icon: Icons.phone,
                        onSuffixPressed: () {},
                        label: "Phone Number "),
                    const SizedBox(
                      height: 13.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                        color: Colors.transparent,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 21.0),
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      width: MediaQuery.of(context).size.width,
                      height: 65.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dtmDOB == null
                              ? " Date of Birth: "
                              : dtmDOB.toString()),
                          IconButton(
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1901),
                                      lastDate: DateTime(2222))
                                  .then((date) {
                                setState(() {
                                  dtmDOB = date;
                                  print(dtmDOB);
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 21.0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                            isDense: true,
                            validator: (text) {
                              if (text == null) {
                                return 'Required';
                              }
                              return null;
                            },
                            isExpanded: true,
                            hint: Text("Select Your District ",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.044,
                                )),
                            value: District,
                            items: districtItemList.map((category) {
                              return DropdownMenuItem(
                                  value: category['ID'],
                                  child: Text(category['DistrictName']));
                            }).toList(),
                            onChanged: (value) async {
                              setState(() {
                                District = value as int?;
                                print("this containes $District");
                              });
                            },
                            onSaved: (input) => District = input as int?,
                            icon: Icon(
                              Icons.search_outlined,
                              color: Colors.grey.shade900,
                              size: 30.0,
                            ),
                            dropdownColor: Colors.deepPurple.shade50,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    RegisterFields(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      contentPadding: const EdgeInsets.all(22.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onChanged: (String value) {
                        strEmail = value;
                      },
                      onsaved: (input) => strEmail = input,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      label: "Email",
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      margin: const EdgeInsets.symmetric(horizontal: 27.0),
                      child: const Text(
                        "Please Select Your Gender : ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: size.width,
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'Male';
                                id = 1;
                              });
                            },
                          ),
                          Text(
                            'Male',
                            style: TextStyle(fontSize: size.width * 0.041),
                          ),
                          Radio(
                            value: 2,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'Female';
                                id = 2;
                                print(radioButtonItem);
                              });
                            },
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: size.width * 0.041,
                            ),
                          ),
                          Radio(
                            value: 3,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'Others';
                                id = 3;
                                print(radioButtonItem);
                              });
                            },
                          ),
                          Text(
                            'Others',
                            style: TextStyle(fontSize: size.width * 0.041),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    RegisterFields(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        contentPadding: const EdgeInsets.all(22.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        onChanged: (String value) {
                          password = value;
                        },
                        onsaved: (input) => password = input,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Required';
                          } else if (text.length < 6) {
                            return "Minimun Length Should be 6";
                          }
                          return null;
                        },
                        onSuffixPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        obscureText: hidePassword,
                        icon: hidePassword
                            ? Icons.visibility_off_sharp
                            : Icons.visibility,
                        label: "Password"),
                    const SizedBox(
                      height: 23.0,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Mybuttons(
                            onpressed: (() => _saveForm(context)),
                            label: "Register",
                            color: Colors.blueGrey.shade600)),
                    const SizedBox(
                      height: 23.0,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 53.0,
          ),
        ],
      ),
    );
  }

  Future fetchDistrictDropDown() async {
    try {
      var response = await http.get(
          Uri.parse("${kMediflowApiUrl}api/v2/Registration/GetDistrict"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      print(response.body);
      if (response.body.isNotEmpty) {
        print(response.body);
        var jsonData = json.decode(response.body);
        print("thusss: $jsonData");
        List<dynamic> district = jsonData["data"];
        setState(() {
          districtItemList = district;
          print("ojoj $districtItemList");
        });
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
  }

  Future _saveForm(BuildContext context) async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      EasyLoading.dismiss();
      EasyLoading.show(status: "Registering");

      var response = await ApiService().patientNewRegister(NewPatientRegister(
        srtfname: srtfname.toString(),
        strMname: strMname.toString(),
        strLname: strLname.toString(),
        strGender: radioButtonItem.toString(),
        dtmDOB: dtmDOB!.toString(),
        intmobile: intmobile.toString(),
        district: District,
        strEmail: strEmail.toString(),
        password: password.toString(),
        deviceIdentity:
            Platform.isAndroid ? "Android".toString() : "IPHONE".toString(),
      ));
      print('new');
      print(response['code']);
      print(response['code'].runtimeType);
      if (response['code'] == null) {
        EasyLoading.dismiss();
        EasyLoading.showInfo("Something went wrong please try again later");
      } else if (response['code'] == '400') {
        EasyLoading.dismiss();
        EasyLoading.showInfo("This Email Already Exits");
      } else if (response['code'] == '500') {
        EasyLoading.dismiss();
        EasyLoading.showInfo("Something went wrong please try again later");
      } else {
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Account Sucessfully Created");
        Navigator.pop(context);
      }
    }
  }
}
