import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/models/credits_card.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final card = CreditsCard(
    cardNumberHidden: '5555',
    cardNumber: '5555555555554444',
    brand: 'mastercard',
    cvv: '213',
    expiracyDate: '01/25',
    cardHolderName: 'Melissa Flores'
    );


    return Scaffold(
      appBar: AppBar(title: Text('Pay'),
      
      ),
      body: Stack(
        children: [

          Container(),

          Hero(
            tag: card.cardNumber,
            child: CreditCardWidget(
                      cardNumber: card.cardNumberHidden, 
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                    ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      )
   );
  }
}