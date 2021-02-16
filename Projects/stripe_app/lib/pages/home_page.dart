import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Pay'),
      actions: [
        IconButton(icon: Icon(Icons.add), onPressed: (){}),
      ],
      ),
      body: Stack(
        children: [
          
          Positioned(
            width: size.width,
            height: size.height,
            top: 100,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.8
              ),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (context, i){
                final card = tarjetas[i];
                return CreditCardWidget(
                  cardNumber: card.cardNumberHidden,
                  expiryDate: card.expiracyDate,
                  cardHolderName: card.cardHolderName,
                  cvvCode: card.cvv,
                  showBackView: false,
                );
              },

            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ]
      )
   );
  }
}