import 'package:flutter/material.dart';
import 'package:stripe_app/models/stripe_custom_response.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  StripeService._privateContructor();

  static final StripeService _instance = StripeService._privateContructor();

  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  String _secretKey =
      'sk_test_51IN8WbFDFJjKdaSPfodYjqjDcNhLla3LYhemNkVVxGYSHQ3bzhJLxKFPFnSwFnZu5Hf5CqCRiifMqA7aAYR4diiw00f8JjXwvh';
  String _apiKey =
      'pk_test_51IN8WbFDFJjKdaSPDCcO66I9MkLhSEzSnBv7SBxgjXXZYZZWOb9RUiH9oX0dePUGu95rnmtFvtKcg0Gk8TOaYnw100QAV1WdiI';

  void init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: this._apiKey,
        androidPayMode: 'test',
        merchantId: 'test'));
  }

  Future payWithExistCard({
    @required String amount,
    @required String currency,
    @required CreditCard card,
  }) async {}

  Future payWithNewCard({
    @required String amount,
    @required String currency,
  }) async {
    try {
      final paymentMethod =
          await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest());

          //TODO: Crear un intent.

      return StripeCustomResponse(ok: true,msg: 'Todo Correcto!');
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future payWithAppleOrGoogle({
    @required String amount,
    @required String currency,
  }) async {}

  Future _createPaymentIntent({
    @required String amount,
    @required String currency,
  }) async {}

  Future _realicePay({
    @required String amount,
    @required String currency,
    @required PaymentMethod paymentMethod,
  }) async {}
}
