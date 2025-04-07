import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class BtnFollowUserRoute extends StatelessWidget {
  const BtnFollowUserRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,

        child: IconButton(
          onPressed: () {
            mapBloc.add(OnToggleUserRoute());
          },
          icon: Icon(Icons.more_horiz, color: Colors.black),
        ),
      ),
    );
  }
}
