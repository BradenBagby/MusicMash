import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';
import 'package:music_mash/dao/api.dart';
import 'package:music_mash/utilities/route_controller.dart';
import 'package:music_mash/widgets/common/mash_short_info.dart';
import 'package:music_mash/widgets/common/room_info.dart';
import 'package:music_mash/widgets/common/user_card.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomCubit, RoomState>(
      listener: (context, state) {
        if (state.tracks.isNotEmpty) {
          Navigator.of(context).pushReplacementNamed(RouteController.mashed);
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
            _userList(context),
            MashShortInfo(),
            RoomInfo()
          ],
        ),
      )),
    );
  }

  Widget _userList(BuildContext context) {
    return Container(
      height: 100,
      child: BlocBuilder<RoomCubit, RoomState>(builder: (context, state) {
        return Wrap(
          children: [
            ...state.users
                .map((e) => Container(
                    padding: EdgeInsets.all(8),
                    key: ValueKey(e),
                    child: UserCard(e)))
                .toList()
          ],
        );
      }),
    );
  }
}
