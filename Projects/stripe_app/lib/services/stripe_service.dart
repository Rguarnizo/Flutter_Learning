import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stripe_app/models/payment_intent_response.dart';
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

  Options headerOptions;

  void init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: this._apiKey,
        androidPayMode: 'test',
        merchantId: 'test'));

    headerOptions =
        Options(contentType: Headers.formUrlEncodedContentType, headers: {
      'Authorization': 'Bearer $_secretKey',
    });
  }

  Future<StripeCustomResponse> payWithExistCard({
    @required String amount,
    @required String currency,
    @required CreditCard card,
  }) async {
    try {
      final paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card));

      final resp = await this._realicePay(
          amount: amount, currency: currency, paymentMethod: paymentMethod);

      return resp;
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future payWithNewCard({
    @required String amount,
    @required String currency,
  }) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());

      final resp = await this._realicePay(
          amount: amount, currency: currency, paymentMethod: paymentMethod);

      return resp;
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future payWithAppleOrGoogle({
    @required String amount,
    @required String currency,
  }) async {
    try {
      final token = await StripePayment.paymentRequestWithNativePay(
          androidPayOptions: AndroidPayPaymentRequest(
              currencyCode: currency, totalPrice: amount),
          applePayOptions: ApplePayPaymentOptions(
              currencyCode: currency,
              countryCode: 'US',
              items: [ApplePayItem(amount: '${double.parse(amount)/100}' , label: 'Super Producto')]));

    final paymentMethod = await StripePayment.createPaymentMethod(PaymentMethodRequest(token:token));

    final resp = await this._realicePay(
          amount: amount, currency: currency, paymentMethod: paymentMethod);

      StripePayment.completeNativePayRequest();

      return resp;
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future<PaymentIntentResponse> _createPaymentIntent({
    @required String amount,
    @required String currency,
  }) async {
    try {
      final dio = Dio();

      final data = {
        'amount': amount,
        'currency': currency,
      };

      final resp = await dio.post(this._paymentApiUrl,
          data: data, options: this.headerOptions);

      return PaymentIntentResponse.fromJson(resp.data);
    } on Exception catch (e) {
      print('Error en intento:');
      return PaymentIntentResponse(
        status: '400',
      );
    }
  }

  Future<StripeCustomResponse> _realicePay({
    @required String amount,
    @required String currency,
    @required PaymentMethod paymentMethod,
  }) async {
    try {
      final paymentIntent =
          await this._createPaymentIntent(amount: amount, currency: currency);

      final paymentResult = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent.clientSecret,
              paymentMethodId: paymentMethod.id));

      if (paymentResult.status == 'succeeded') {
        return StripeCustomResponse(ok: true, msg: 'Todo correcto');
      } else {
        return StripeCustomResponse(ok: false, msg: paymentResult.status);
      }
    } on Exception catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }
}
