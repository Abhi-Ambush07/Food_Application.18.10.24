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
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  String cardNumber=''; 
  String expiryDate='' ;
  String cardHolderName='' ; 
  String cvvCode=''; 
  bool isCvvFocused=false;
  //user wants to pay
  void userTappedpay(){
    if(formKey.currentState!.validate()){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number :$cardNumber"),
                Text("Expiry date :$expiryDate"),
                Text("Card Holder Name :$cardHolderName"),
                Text("CVV :$cvvCode"),    
              ],
              ),
          ),
          actions: [
             TextButton(
              onPressed:()=>Navigator.pop(
                context
                ),
              child: const Text("Cancel"),
              ),
            //cancel button
            TextButton(
              onPressed:()=>Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context)=>DeliveryProgressPage(),
                  )
              ), 
              child: const Text("Yes"),
              )
            //yes button
          ],
        )
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
        body: Column(
          children: [
            //credit card
            CreditCardWidget(
              cardNumber:cardNumber , 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              showBackView: isCvvFocused, 
              onCreditCardWidgetChange:(p0){} ,
              ),
              //credit card form
              CreditCardForm(
              cardNumber: cardNumber,
               expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data){
                  setState(() {
                    cardNumber=data.cardNumber;
                    expiryDate=data.expiryDate;
                    cardHolderName=data.cardHolderName;
                    cvvCode=data.cvvCode;
                  });
                },
                formKey: formKey
                ),
                const Spacer(),
                MyButton(
                  text: "Pay now",
                  onTap:userTappedpay,
                  ),
          ],
        ),
    );
  }
}