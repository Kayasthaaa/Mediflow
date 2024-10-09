import 'package:flutter/material.dart';

class Grids extends StatelessWidget {
  final double? height;
  const Grids({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: height,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          Image.asset("images/prescription.png"),
          Image.asset("images/radiology.png"),
          Image.asset("images/addmission.png"),
          Image.asset("images/myDocs.png"),
          Image.asset("images/lab.png"),
        ],
      ),
    );
  }
}
