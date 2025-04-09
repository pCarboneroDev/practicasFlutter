import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:practicas_flutter/models/payment_intent_response.dart';
import 'package:practicas_flutter/models/stripe_custom_response.dart';

class StripeService{
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;


  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  static String _secretKey = 'sk_test_51RBujzA4nC6svE2djUE8A2AOTyu57iwgmfR51WOGALX0fbdm3YdnytK15bZgaJ1t0JHuYyE5cJpmdBoQoz414sBc00I5TKQb7c';
  String _apiKey = 'pk_test_51RBujzA4nC6svE2du8UlOyvax8JAG05fYYhQQfkjl7jxJYiC0fYjaIcyfrTB0rOIE8Q4PmTaVEKtXAit3rAfojOt0050YO00Bt';

  final headerOptions = new Options(
    contentType: Headers.formUrlEncodedContentType,
    headers: {
      'Authorization': 'Bearer $_secretKey'
    }
  );

  void init(){
    Stripe.publishableKey = this._apiKey;
    Stripe.merchantIdentifier = 'test';
  }

  // Stripe.publishableKey = this._apiKey;
  //Stripe.

  Future pagarConTarjetExistente({
    required String amount,
    required String currency,
    required CreditCardModel card,
  }) async {
    
  }

  Future pagarConNuevaTarjeta({
    required String amount,
    required String currency,
  }) async {

    try{

      try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card( 
          paymentMethodData: PaymentMethodData()
        )
      );

      /*final paymentIntent = await _crearPaymentIntent(amount, currency);

      final paymentIntentResult = await Stripe.instance.confirmPayment(
        paymentIntent['clientSecret'],
        PaymentMethodParams.card(paymentMethodId: paymentMethod.id),
      );

      if (paymentIntentResult.status == PaymentIntentsStatus.Succeeded) {
        return StripeCustomResponse(ok: true, msg: 'Pago exitoso');
      } else {
        return StripeCustomResponse(ok: false, msg: 'Pago fallido: ${paymentIntentResult.status}');
      }*/
      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }

    }catch(e){
      return StripeCustomResponse(ok: false, msg: e.toString());
    }

  }

  Future pagarConAppleGooglePay({
    required String amount,
    required String currency,
  }) async {

  }

  Future _crearPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    
    try{

      final dio = new Dio();
      final data = {
        'amount': amount,
        'currency': currency
      };

      final response = await dio.post(
        _paymentApiUrl,
        data: data,
        options: headerOptions
      );

      return PaymentIntentResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return '400';
    }

  }

  Future _realizarPago({
    required String amount,
    required String currency,
    required PaymentMethod PaymentMethod
  }) async {

  }
}