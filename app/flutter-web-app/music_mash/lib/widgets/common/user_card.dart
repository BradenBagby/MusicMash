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
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                user.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
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
