import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';

import 'package:mediflow_bloc/widgets/DasboardWidgets/dashboardWidgets.dart';
import 'package:mediflow_bloc/widgets/Texts.dart';

class TransactionDetails extends StatefulWidget {
  final Datum? usertransactions;
  const TransactionDetails({Key? key, this.usertransactions}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Texts(text: "Transaction Details"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 23.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11),
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                          width: 60,
                          child: Image.asset("images/ai.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Payment of ",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.040),
                                  ),
                                  TextSpan(
                                    text:
                                        "Rs. ${widget.usertransactions?.amount}",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.040),
                                  ),
                                  TextSpan(
                                    text: " made to  \n",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.040),
                                  ),
                                  TextSpan(
                                    text: widget.usertransactions?.hospitalName,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.040),
                                  ),
                                  TextSpan(
                                    text:
                                        " from ${widget.usertransactions?.gateway}",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.040),
                                  ),
                                ],
                              ),
                            ),
                            Texts(
                              text:
                                  "Transaction ID: ${widget.usertransactions?.transactionId}",
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            Texts(
                              text:
                                  "Date : ${widget.usertransactions?.consultantDate}",
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MediaContainer(
                  height: 54,
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade400,
                      borderRadius: BorderRadius.circular(9)),
                  onTap: () {},
                  child: const Center(
                    child: Texts(
                      text: "DOWNLOAD RECEIPT",
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  indent: 22,
                  endIndent: 22,
                  color: Colors.black54,
                ),
                const SizedBox(
                  height: 10,
                ),
                MediaContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Texts(
                                text: "Amount (NPR) :",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Texts(
                                  text: widget.usertransactions?.amount ?? "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Texts(
                                text: "Purpose :",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Texts(
                                  text: widget.usertransactions?.billingmode ??
                                      "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MediaContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Texts(
                                text: "Sender Name :",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Texts(
                                  text: widget.usertransactions?.fullname ?? "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Texts(
                                text: "Purpose :",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Texts(
                                  text: widget.usertransactions?.gateway ?? "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MediaContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Texts(
                                text: "Receiver Name :",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Texts(
                                  text:
                                      widget.usertransactions?.corpoName ?? "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Texts(
                                text: "Remarks :",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Texts(
                                  text: widget.usertransactions?.message ??
                                      "Payment",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
