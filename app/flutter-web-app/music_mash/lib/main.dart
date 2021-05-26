import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';
import 'package:music_mash/utilities/injection.dart';
import 'package:music_mash/utilities/route_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injection.setup();

  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoomCubit>(
          create: (context) => GetIt.instance<RoomCubit>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: RouteController.initial,
        onGenerateRoute: RouteController.generateRoute,
      ),
    );
  }
}
