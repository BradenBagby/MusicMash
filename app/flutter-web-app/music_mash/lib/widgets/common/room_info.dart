import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';
import 'package:music_mash/utilities/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RoomInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(builder: (context, state) {
      if (state.sessionId.isEmpty) {
        return Container(
          height: 50,
          child: CircularProgressIndicator(),
        );
      }

      return Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Join Code:",
                    style: Theme.of(context).textTheme.headline2!.merge(
                        TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  Text(
                    state.sessionId,
                    style: Theme.of(context).textTheme.headline2!.merge(
                        TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              QrImage(
                data: "${Constants.HOST}/app/${state.sessionId}",
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ),
      );
    });
  }
}
