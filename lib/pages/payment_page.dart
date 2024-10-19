import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodapp/components/my_button.dart';
import 'package:foodapp/pages/delivery_progress_page.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = ''; 
  String expiryDate = ''; 
  String cardHolderName = ''; 
  String cvvCode = ''; 
  bool isCvvFocused = false;

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV: $cvvCode"),    
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            // Confirm button
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryProgressPage(),
                ),
              ), 
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView( // Wrapped with SingleChildScrollView to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Added padding for a cleaner layout
          child: Column(
            children: [
              // Credit card widget
              CreditCardWidget(
                cardNumber: cardNumber, 
                expiryDate: expiryDate, 
                cardHolderName: cardHolderName, 
                cvvCode: cvvCode, 
                showBackView: isCvvFocused, 
                onCreditCardWidgetChange: (p0) {},
              ),
              const SizedBox(height: 20), // Added spacing between elements

              // Credit card form
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey,
              ),
              const SizedBox(height: 20), // More spacing between the form and button

              // Pay button
              MyButton(
                text: "Pay now",
                onTap: userTappedPay,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
