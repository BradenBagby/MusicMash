import 'package:flutter/material.dart';
import 'package:music_mash/domain/user/session_user.dart';

class UserCard extends StatelessWidget {
  final SessionUser user;
  const UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            color: Theme.of(context).primaryColorLight,
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                user.name,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .merge(TextStyle(fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
