import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/blocs/gps/gps_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
   
  const GpsAccessScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
              ? const _EnableGpsMessage()
              : const _AccessButton();
          },
        ),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        const Text('Es necesario el acceso al gps'),
        MaterialButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          shape: const StadiumBorder(),
          color: Colors.black,
          child: const Text('Solicitar acceso', 
            style: TextStyle(color: Colors.white)
          ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Debe de habilitar el gps',
      style: TextStyle(fontSize: 25, 
      fontWeight: FontWeight.bold)
    );
  }
}