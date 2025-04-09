import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/bloc/pagar/pagar_bloc.dart';
import 'package:practicas_flutter/pages/home_page.dart';
import 'package:practicas_flutter/pages/pago_completo_page.dart';
import 'package:practicas_flutter/services/stripe_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    new  StripeService()..init();


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PagarBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'pago_completo': (_) => PagoCompletoPage(),
        },
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff284879),
          scaffoldBackgroundColor: Color(0xff21232A),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 40, 74, 134), 
            foregroundColor: Colors.white
          )
        ),
      ),
    );
  }
}