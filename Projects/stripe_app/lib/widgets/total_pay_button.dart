import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/Pay/pay_bloc.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/services/stripe_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

class TotalPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '250.00 USD',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          _BtnPay(),
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  const _BtnPay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayBloc, PayState>(
      builder: (context, state) {
        return state.activeCard ? buildBtnCard(context) : buildBtn(context);
      },
    );
  }

  Widget buildBtn(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white),
          SizedBox(
            width: 30,
          ),
          Text(
            'Pay',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildBtnCard(BuildContext context) {
    final stripeService = StripeService();
    final payBloc = BlocProvider.of<PayBloc>(context);

    return MaterialButton(
      onPressed: () async {
        final data = payBloc.state;
        final card = data.card;
        final mesAnio = card.expiracyDate.split('/');

        showLoading(context);

       final resp = await  stripeService.payWithExistCard(
            amount: data.payAmountStr,
            currency: data.currency,
            card: CreditCard(
                number: card.cardNumber,
                expMonth: int.parse(mesAnio[0]),
                expYear: int.parse(mesAnio[1])));

        Navigator.pop(context);

        if(resp.ok){
          showAlert(context, 'Todo bien', 'Todo salio correctamente, pago realizado');
        }else{
          showAlert(context, 'Algo paso mal', 'Algo mal succedio, no se te ha cobrado no te preocupes');
        }



      },
      height: 45,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          SizedBox(
            width: 30,
          ),
          Text(
            'Pay',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
