import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/bloc/usuario/usuario_cubit.dart';
import 'package:practicas_flutter/pages/pagina1_page.dart';
import 'package:practicas_flutter/pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => new UsuarioCubit(),
        )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (context) => Pagina1Page(),
          'pagina2': (context) => Pagina2Page(),
        },
      ),
    );
  }
}