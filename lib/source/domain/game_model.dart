import 'package:abo/common/converter/datetime_converter.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:collection/collection.dart';

class GameModel {
  final String gameId;
  final DateTime gameDate;
  final UserModel? homeUser;
  final UserModel? awayUser;

  const GameModel({
    required this.gameId,
    required this.gameDate,
    this.homeUser,
    this.awayUser,
  });

  Map<String, dynamic> toJson() => {
        'id': gameId,
        'game_date': gameDate,
        'home_team_id': homeUser?.teamKey,
        'away_team_id': awayUser?.teamKey,
      };

  static GameModel fromJson(Map<String, dynamic> json, List<UserModel> userList) {
    return GameModel(
      gameId: json['id'].toString(),
      // gameId: '',
      gameDate: DateJsonConverter().fromJson(json['game_date'] as String),
      // gameDate: DateTime.now(),
      homeUser: userList.firstWhereOrNull((e) => json['home_team_id'] == e.teamKey),
      awayUser: userList.firstWhereOrNull((e) => json['away_team_id'] == e.teamKey),
    );
  }

  GameModel copyWith({
    final String? gameId,
    final DateTime? gameDate,
    final UserModel? homeUser,
    final UserModel? awayUser,
  }) {
    return GameModel(
      gameId: gameId ?? this.gameId,
      gameDate: gameDate ?? this.gameDate,
      homeUser: homeUser ?? this.homeUser,
      awayUser: awayUser ?? this.awayUser,
    );
  }
}
