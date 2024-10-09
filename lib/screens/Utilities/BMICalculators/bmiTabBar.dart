import 'package:flutter/material.dart';

import 'BMICalculator.dart';
import 'BmiCM.dart';

class tabBarBmi extends StatefulWidget {
  const tabBarBmi({Key? key}) : super(key: key);

  @override
  State<tabBarBmi> createState() => _tabBarBmiState();
}

class _tabBarBmiState extends State<tabBarBmi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(15.0))),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(right: 38.0),
              child: Text(
                'BMI Index',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "In feet",
                icon: Icon(Icons.highlight),
              ),
              Tab(
                text: "In Cm",
                icon: Icon(Icons.highlight),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [BMI(), BMICm()],
        ),
      ),
    );
  }
}
