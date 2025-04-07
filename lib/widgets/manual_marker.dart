import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/helpers/show_loading_message.dart';
import '../blocs/blocs.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.displayManualMarker){
          return const _ManualMarkerBody();
        }
        else{
          return const SizedBox();
        }
      },
    );
  }
}

class _ManualMarkerBody extends StatelessWidget {
  const _ManualMarkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return SizedBox(
      width: size.width,
      height: size.height,

      child: Stack(
        children: [
          const Positioned(
            top: 60,
            left: 20,
            child: _BtnBack()
          ),

          Center(
            child: Transform.translate(
              offset: Offset(0, -20),
              child: BounceInDown(
                from: 100,
                child: const Icon(Icons.location_on_rounded, size: 50, color: Color.fromARGB(255, 2, 159, 221),)),
            ),
          ),


          Positioned(
            bottom: 70,
            left: 40,
            child: FadeInUp(
              duration: const Duration(milliseconds: 300),

              child: MaterialButton(
                onPressed: () async {
                  //TODO loading

                  final start = locationBloc.state.lastKnownLocation;
                  if (start == null) return;
                  final end = mapBloc.mapCenter;
                  if (end == null) return;

                  showLoadingMessage(context);

                  final resp = await searchBloc.getCoorsStartToEnd(start, end);
                  await mapBloc.drawRoutePolyline(resp);
                  searchBloc.add(OnDeactivateManualMarkerEvent());

                  Navigator.pop(context);
                },
                minWidth: size.width -120,
                color: Colors.white,
                elevation: 0,
                shape: StadiumBorder(),
                child: const Text('Confirmar destino', style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold
                  )
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),

      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {
            BlocProvider.of<SearchBloc>(context).add(OnDeactivateManualMarkerEvent());
          }, 
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)
        ),
      ),
    );
  }
}