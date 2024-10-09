import 'package:flutter/material.dart';

class Utilities extends StatelessWidget {
  const Utilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 13.0,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/bmi-calculator');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //color: const Color.fromRGBO(255, 253, 208, 100),
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 105,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 70.0,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("images/bmi.png")),
                        Text(
                          "BMI",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 13.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 105,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 70.0,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("images/ai.png"),
                        ),
                        Text(
                          "GCS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 13.0,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edd-calculator');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 105,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 70.0,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("images/eddd.png")),
                        Text(
                          "EDD",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
