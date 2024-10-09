import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Edd extends StatefulWidget {
  const Edd({Key? key}) : super(key: key);

  @override
  State<Edd> createState() => _EddState();
}

class _EddState extends State<Edd> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateTime1;
  DateTime? _dateTime2;
  DateTime? Est;
  final now = DateTime.now();
  TextEditingController date2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text("Edd Calculator"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0))),
      ),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Enter the date",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text("Today's Date :"),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(DateFormat('yMd').format(now)),
                              ],
                            ),
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_dateTime2 == null
                                ? "First day of last period : "
                                : DateFormat('yMd').format(_dateTime2!)),
                            IconButton(
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1901),
                                        lastDate: DateTime(2222))
                                    .then((date) {
                                  setState(() {
                                    _dateTime2 = date;
                                    print("This has date :$_dateTime2");
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
                        height: 25.0,
                      ),
                      Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Results",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Estimated due date is: ",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height: 50,
                                  child: Est == null
                                      ? TextFormField(
                                          controller: date2Controller,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            suffixIcon: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              child: Icon(
                                                Icons.calendar_month,
                                                color: Colors.blueAccent,
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ))
                                      : IgnorePointer(
                                          child: TextFormField(
                                              controller: dateController,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: DateFormat('yMd')
                                                    .format(Est!),
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.035),
                                                suffixIcon: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.blueAccent,
                                                  ),
                                                ),
                                                fillColor: Colors.white,
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.shade500,
                                                  ),
                                                ),
                                              )),
                                        ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: 30.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          )),
                                      onPressed: () {
                                        calc();
                                      },
                                      child: const Text(
                                        "Calculate",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: 30.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          )),
                                      onPressed: () {
                                        setState(() {
                                          _dateTime2 = null;
                                          Est = null;
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
                              height: 25.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  calc() async {
    final EstDate = _dateTime2?.add(const Duration(days: 280));
    setState(() {
      Est = EstDate;
      print("This is yah : $Est");
    });
  }
}
