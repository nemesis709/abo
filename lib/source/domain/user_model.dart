import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    int? teamKey, // 일정에서 팀에 매칭할 키
    required String name,
    required int game,
    required int win,
    required int draw,
    required int lose,
    required int point,
    required double rate,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
