import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,

        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                mapBloc.add(OnStartFollowingUserEvent());
              },
              icon: Icon( state.followUser
                  ? Icons.center_focus_strong_outlined
                  : Icons.hail_rounded,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
