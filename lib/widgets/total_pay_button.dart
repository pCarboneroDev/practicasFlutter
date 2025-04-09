import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practicas_flutter/bloc/pagar/pagar_bloc.dart';
import 'package:practicas_flutter/services/stripe_service.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final pagarBloc = BlocProvider.of<PagarBloc>(context);

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('${pagarBloc.state.montoPagar} ${pagarBloc.state.moneda}', style: TextStyle(fontSize: 20)),
            ],
          ),

          BlocBuilder<PagarBloc, PagarState>(
            builder: (context, state) {
              return _BtnPay(pagarBlocState: state);
            },
          ),
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  final PagarState pagarBlocState;

  const _BtnPay({required this.pagarBlocState});

  @override
  Widget build(BuildContext context) {
    return pagarBlocState.tarjetaActiva ? buildBotonTarjeta(context) : buildAppleGooglePay(context);
  }

  Widget buildBotonTarjeta(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {
        final stripeService = new StripeService();

        stripeService.pagarConTarjetExistente(
          amount: pagarBlocState.montoPagarString, 
          currency: pagarBlocState.moneda, 
          card: CreditCardModel(
            pagarBlocState.tarjeta!.cardNumber,
            pagarBlocState.tarjeta!.expiracyDate,
            pagarBlocState.tarjeta!.cardHolderName,
            pagarBlocState.tarjeta!.cvv,
            false
          )
        );

      },
      child: Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          Text('   Pagar', style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
    );
  }

  Widget buildAppleGooglePay(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Platform.isAndroid
                ? FontAwesomeIcons.google
                : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          Text('  Pay', style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
    );
  }
}
