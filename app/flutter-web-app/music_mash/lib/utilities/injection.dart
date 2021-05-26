import 'package:get_it/get_it.dart';
import 'package:music_mash/application/cubit/room_cubit.dart';

class Injection {
  static void setup() {
    GetIt.instance.registerSingleton<RoomCubit>(RoomCubit()..start());
  }
}
