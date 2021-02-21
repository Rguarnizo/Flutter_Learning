import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/Pay/pay_bloc.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/card_page.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payBloc = BlocProvider.of<PayBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Pay'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  showLoading(context);
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pop(context);
                  showAlert(context, 'This is a title',
                      'This is a message of dialog');
                }),
          ],
        ),
        body: Stack(children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 100,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (context, i) {
                final card = tarjetas[i];
                return Hero(
                  tag: card.cardNumber,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, navegateFadeIn(context, CardPage()));
                          payBloc.add(OnSelectCard(card));
                    },
                    child: CreditCardWidget(
                      cardNumber: card.cardNumberHidden,
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ]));
  }
}
