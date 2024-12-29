import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String name,
    required int game,
    required int win,
    required int draw,
    required int lose,
    required int point,
    required double rate,
    int? serverKey, // 서버 번호
    int? teamKey, // 일정에서 팀에 매칭할 키
    int? managerKey, // 사용중인 감독
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
