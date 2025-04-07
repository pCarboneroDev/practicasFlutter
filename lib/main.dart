import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/services/services.dart';


import 'blocs/blocs.dart';
import 'screens/screens.dart';


void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GpsBloc(),
      ),
      BlocProvider(
        create: (context) => LocationBloc(),
      ),
      BlocProvider(
        create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)),
      ),
      BlocProvider(
        create: (context) => SearchBloc(trafficService: TrafficService()),
      )
    ], 
    child: MapsApp()
    )
  );
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaterialApp',
      home: LoadingScreen(),
    );
  }
}