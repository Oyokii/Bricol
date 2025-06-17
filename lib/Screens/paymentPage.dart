import 'package:bricol/Services/stripe_service.dart';
import 'package:flutter/material.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  late final int? prix;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                StripeService.instance.makePayment(prix!);
              },
              color: Colors.green,
              child: const Text("Purchase"),
            )
          ],
        ),
      )),
    );
  }
}
