import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';
import 'package:music_mash/dao/api.dart';

class MashShortInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<RoomCubit, RoomState>(builder: (context, state) {
        if (state.mashing == false) {
          return Center(
              child: ElevatedButton(
            child: Text(
              "Start",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .merge(TextStyle(color: Colors.white)),
            ),
            onPressed: () {
              Api.startMash(
                  BlocProvider.of<RoomCubit>(context).state.sessionId);
            },
          ));
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text("Mashing ...")
            ],
          ),
        );
      }),
    );
  }
}
