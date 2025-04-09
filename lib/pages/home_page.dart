import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:practicas_flutter/data/tarjetas.dart';
import 'package:practicas_flutter/helpers/alertas.dart';
import 'package:practicas_flutter/helpers/navegar_fadein.dart';
import 'package:practicas_flutter/pages/tarjeta_page.dart';
import 'package:practicas_flutter/widgets/total_pay_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        actions: [
          IconButton(
            onPressed: () async {
              /*mostrarLoading(context);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context);*/
              mostrarAlerta(context, 'Hola', 'Mundo');
            }, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9
              ),
            
              itemCount: tarjetas.length,
            
              itemBuilder: (context, index) {
                final tarjeta = tarjetas[index];
            
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, navegarFadeIn(context, TarjetaPage()));
                  },
                  child: AbsorbPointer(
                    child: Hero(
                      tag: tarjeta.cardNumber,

                      child: CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden,
                        expiryDate: tarjeta.expiracyDate,
                        cardHolderName: tarjeta.cardHolderName,
                        cvvCode: tarjeta.cvv,
                        showBackView: false,
                        onCreditCardWidgetChange: (p0) {
                          
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Positioned(
            bottom: 0,
            child: TotalPayButton()
          )
        ],
      ),
   );
  }
}