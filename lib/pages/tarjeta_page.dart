import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:practicas_flutter/bloc/pagar/pagar_bloc.dart';
import 'package:practicas_flutter/models/tarjeta_credito.dart';
import 'package:practicas_flutter/widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pagarBloc = BlocProvider.of<PagarBloc>(context);

    final tarjeta = pagarBloc.state.tarjeta;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        leading: IconButton(
        onPressed: () {
          
          final pagarBloc = BlocProvider.of<PagarBloc>(context);
          pagarBloc.add(OnDesactivarTarjeta());
        
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back)
      )
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: tarjeta!.cardNumber,

            child: CreditCardWidget(
              cardNumber: tarjeta.cardNumberHidden,
              expiryDate: tarjeta.expiracyDate,
              cardHolderName: tarjeta.cardHolderName,
              cvvCode: tarjeta.cvv,
              showBackView: false,
              onCreditCardWidgetChange: (p0) {},
            ),
          ),

          Positioned(bottom: 0, child: TotalPayButton()),
        ],
      ),
    );
  }
}
