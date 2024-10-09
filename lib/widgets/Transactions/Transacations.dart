import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediflow_bloc/Models/ModelClass.dart';
import 'package:mediflow_bloc/provider/ApiClass/APIService.dart';
import 'package:mediflow_bloc/screens/TransactionDetails.dart';
import 'package:mediflow_bloc/widgets/Texts.dart';
import 'package:mediflow_bloc/widgets/customeTexts.dart';
import 'package:provider/provider.dart';

class ListTransactions extends StatefulWidget {
  const ListTransactions({Key? key}) : super(key: key);

  @override
  _ListTransactionsState createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  void initState() {
    context.read<ApiTransactions>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Transactions? transactions =
        context.watch<ApiTransactions>().transactionsHistory;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Transaction History",
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
      ),
      body: transactions?.data == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 22.0),
              height: size.height,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: transactions?.data.length,
                itemBuilder: ((BuildContext context, index) {
                  var data = transactions?.data[index];
                  print(data.runtimeType);
                  return Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionDetails(
                              usertransactions: transactions?.data[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        shadowColor: Colors.blue,
                        elevation: 6,
                        child: Container(
                          height: 130,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset("images/ai.png"),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Texts(
                                      text: transactions
                                              ?.data[index].consultant ??
                                          "",
                                      fontSize: size.width * 0.043,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Texts(
                                      text:
                                          transactions?.data[index].corpoName ??
                                              "",
                                      fontSize: size.width * 0.038,
                                      color: Colors.grey,
                                    ),
                                    Texts(
                                      text: transactions
                                              ?.data[index].consultantDate ??
                                          "",
                                      fontSize: size.width * 0.038,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Texts(
                                        text: "Rs. ",
                                        fontSize: size.width * 0.038,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                      Texts(
                                        text:
                                            transactions?.data[index].amount ??
                                                "",
                                        fontSize: size.width * 0.038,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
    );
  }
}
