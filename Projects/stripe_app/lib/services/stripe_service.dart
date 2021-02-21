

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService{



  StripeService._privateContructor();

  static final StripeService _instance = StripeService._privateContructor();

  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  String _secretKey = 'sk_test_51IN8WbFDFJjKdaSPfodYjqjDcNhLla3LYhemNkVVxGYSHQ3bzhJLxKFPFnSwFnZu5Hf5CqCRiifMqA7aAYR4diiw00f8JjXwvh';

  void init(){

  }

  Future payWithExistCard({
    @required String amount,
    @required String currency,
    @required CreditCard card,    
  }) async {

  }

  Future payWithNewCard(
    {
      @required String amount,
      @required String currency,
    }
  ) async {

  }

  
  Future payWithAppleOrGoogle(
    {
      @required String amount,
      @required String currency,
    }
  ) async {

  }

  Future _createPaymentIntent(
    {
      @required String amount,
      @required String currency,
    }
  ) async {

  }

  Future _realicePay(
    {
      @required String amount,
      @required String currency,
      @required PaymentMethod paymentMethod,

    }
  ) async {

  }




}