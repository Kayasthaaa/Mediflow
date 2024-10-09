import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';
import 'package:mediflow_bloc/constant/online_ticket_payment_terms.dart';

class OnlineTicketPayment extends StatelessWidget {
  const OnlineTicketPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultSpacing),
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultSpacing),
            color: kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Choose your payment method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultSpacing),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: kDefaultSpacing,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/payment/esewa.png'),
                        width: 64.0,
                      ),
                      Image(
                        image: AssetImage('assets/images/payment/khalti.png'),
                        width: 64.0,
                      ),
                      Image(
                        image: AssetImage('assets/images/payment/imepay.png'),
                        width: 64.0,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Terms & Condition',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      List.generate(kOnlineTicketPaymentTerms.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: kSmallSpacing),
                      child: Text(
                        '${index + 1}. ${kOnlineTicketPaymentTerms[index]}',
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
