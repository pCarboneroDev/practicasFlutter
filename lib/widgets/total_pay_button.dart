import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('250.55 €', style: TextStyle(fontSize: 20))
            ],
          ),

          _BtnPay()

        ],
      ),
    );
  }
}


class _BtnPay extends StatelessWidget {
  const _BtnPay({super.key});

  @override
  Widget build(BuildContext context) {
    return true 
      ? buildBotonTarjeta(context)
      : buildAppleGooglePay(context);
  }


  Widget buildBotonTarjeta(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {
        
      },
      child: Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white,),
          Text('   Pay', style: TextStyle(color: Colors.white, fontSize: 22)),
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
      onPressed: () {
        
      },
      child: Row(
        children: [
          Icon(
            Platform.isAndroid ?
              FontAwesomeIcons.google
              : FontAwesomeIcons.apple, color: Colors.white,
          ),
          Text('  Pay', style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
    );
  }
}