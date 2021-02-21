import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/Pay/pay_bloc.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/card_page.dart';
import 'package:stripe_app/services/stripe_service.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final payBloc = BlocProvider.of<PayBloc>(context);
    final stripeService = StripeService();

    return Scaffold(
        appBar: AppBar(
          title: Text('Pay'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  final amount = payBloc.state.payAmountStr;
                  final currency = payBloc.state.currency;

                  showLoading(context);

                  final resp = await stripeService.payWithNewCard(amount: amount, currency: currency);

                  Navigator.pop(context);
                  
                  if(resp.ok){
                    showAlert(context, 'Tarjeta OK', 'Todo correcto');
                  } else {
                    showAlert(context, 'Algo paso mal', resp.msg);
                  }

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
