import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';
import 'package:music_mash/utilities/route_controller.dart';
import 'package:music_mash/widgets/common/music_card.dart';

class Mashed extends StatelessWidget {
  bool hitLoad = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomCubit, RoomState>(
      listener: (context, state) {
        if (state.tracks.isEmpty) {
          Navigator.of(context).pushReplacementNamed(RouteController.initial);
        }

        if (state.error.isNotEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("Create Playlist"),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Music Mash",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 8),
                  BlocBuilder<RoomCubit, RoomState>(
                    builder: (context, state) {
                      return Text(
                        state.mashingMessage,
                        style: Theme.of(context).textTheme.subtitle1,
                      );
                    },
                  ),
                  Expanded(child: _mashList(context))
                ],
              ),
            ),
            BlocBuilder<RoomCubit, RoomState>(builder: (context, state) {
              if (state.loadingMore) {
                return SizedBox.expand(
                    child: Container(
                  color: Colors.black.withAlpha(100),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
              }

              return Container();
            })
          ],
        ),
      ),
    );
  }

  Widget _mashList(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(builder: (context, state) {
      return NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent &&
              state.loadingMore == false &&
              state.hasMore &&
              !hitLoad) {
            hitLoad = true;
            log("load more");
            BlocProvider.of<RoomCubit>(context).loadMore();
            Future.delayed(const Duration(milliseconds: 200)).then((value) {
              hitLoad = false;
            });
          }
          return true;
        },
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.of(context).size.width % 300).toInt(),
            ),
            itemCount: state.tracks.length,
            itemBuilder: (context, i) {
              return MusicCard(state.tracks[i]);
            }),
      );
    });
  }
}
