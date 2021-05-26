import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_user.freezed.dart';
part 'session_user.g.dart';

@freezed
class SessionUser with _$SessionUser {
  factory SessionUser({required String name, required String id}) =
      _SessionUser;
  factory SessionUser.fromJson(Map<String, dynamic> json) =>
      _$SessionUserFromJson(json);
}
