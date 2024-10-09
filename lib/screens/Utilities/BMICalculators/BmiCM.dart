import 'dart:math';

import 'package:flutter/material.dart';

class BMICm extends StatefulWidget {
  const BMICm({Key? key}) : super(key: key);

  @override
  State<BMICm> createState() => _BMICmState();
}

class _BMICmState extends State<BMICm> {
  bool visible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerCms = TextEditingController();
  TextEditingController controllerWeight = TextEditingController();
  double? result = 0, numCms = 0, numWt = 0;
  double? height = 0;

  calc() {
    setState(() {
      numCms = double.parse(controllerCms.text);
      numWt = double.parse(controllerWeight.text);
      height = (numCms! * 0.01);
      result = numWt! / pow(height!, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.only(left: 22.0, right: 22.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Height in Cm",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Required';
                              } else if (text.contains(RegExp(r'[a-z]')) ||
                                  text.contains(RegExp(r'[A-Z]')) ||
                                  text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                                return 'Invalid Input';
                              }
                              return null;
                            },
                            controller: controllerCms,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                border: OutlineInputBorder(),
                                labelText: 'Cm'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Required';
                                  } else if (text.contains(RegExp(r'[a-z]')) ||
                                      text.contains(RegExp(r'[A-Z]')) ||
                                      text.contains(RegExp(r'[#?!@$%^&*-]'))) {
                                    return 'Invalid Input';
                                  }
                                  return null;
                                },
                                controller: controllerWeight,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 8.0),
                                    border: OutlineInputBorder(),
                                    labelText: 'Kgs'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent),
                                onPressed: () {
                                  _saveForm();
                                  if (result! > 0) {
                                    visible = true;
                                  }
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _formKey.currentState?.reset();
                                    controllerCms.clear();
                                    controllerWeight.clear();
                                    visible = false;
                                  });
                                },
                                child: const Text(
                                  "Reset",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 13.0,
                      ),
                      Visibility(
                        visible: visible,
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          elevation: 7.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 45.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your body Mass Index is ${result?.toStringAsFixed(3)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 23.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12.0, top: 5.0),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "BMI Categories",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              margin: const EdgeInsets.only(right: 13.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Underweight : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "Small than 18.5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Normal weight : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "18.5 - 24.9",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Overweight : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "25 - 29.9",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Obesity : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "Greater than 30",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      calc();
      setState(() {
        validate();
      });
    }
  }

  validate() {
    if (result! < 18.5) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black54,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You are underweight",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ));
    } else if (result! > 18.5 && result! <= 24.9) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You are fit",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ));
    } else if (result! > 25 && result! <= 29.9) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You are overweight",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ));
    } else if (result! > 30) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You have Severe Obesity",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ));
    }
  }
}
