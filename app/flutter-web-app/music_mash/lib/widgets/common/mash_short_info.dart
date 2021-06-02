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
                start(context);
              },
            ),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text("Mashing ..."),
              Text(state.mashingMessage)
            ],
          ),
        );
      }),
    );
  }

  void start(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("Wait for a Friend"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Continue Anyways"),
      onPressed: () {
        Api.startMash(BlocProvider.of<RoomCubit>(context).state.sessionId);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure"),
      content: Text(
          "No one has joined your room yet. This will just display all your songs on spotify. Have a friend join using the code to compare libararies."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
