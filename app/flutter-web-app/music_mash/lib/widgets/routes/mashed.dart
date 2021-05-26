import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';
import 'package:music_mash/utilities/route_controller.dart';

class Mashed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomCubit, RoomState>(
      listener: (context, state) {
        if (state.tracks.isEmpty) {
          Navigator.of(context).pushReplacementNamed(RouteController.initial);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Music Mash",
                style: Theme.of(context).textTheme.headline2,
              ),
              Expanded(child: _mashList(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget _mashList(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(builder: (context, state) {
      return ListView.builder(
          itemCount: state.tracks.length,
          itemBuilder: (context, i) {
            return Text(state.tracks[i].name);
          });
    });
  }
}
