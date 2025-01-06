import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_update_model.freezed.dart';
part 'auth_update_model.g.dart';

@Freezed()
class AuthUpdateModel with _$AuthUpdateModel {
  const factory AuthUpdateModel({
    required String accessToken,
    required String refreshToken,
    required String email,
    required String password,
  }) = _AuthUpdateModel;

  factory AuthUpdateModel.fromJson(Map<String, dynamic> json) => _$AuthUpdateModelFromJson(json);
}
