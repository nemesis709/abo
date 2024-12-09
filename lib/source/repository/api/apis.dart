import 'package:abo/source/repository/api/auth_api.dart';
import 'package:abo/source/repository/api/dios.dart';
import 'package:abo/source/repository/api/game_api.dart';
import 'package:abo/source/repository/api/player_api.dart';
import 'package:dio/dio.dart';

final apis = Apis.instance;

class Apis {
  //region singleton
  Apis._privateConstructor();

  static final Apis _instance = Apis._privateConstructor();

  static Apis get instance => _instance;

  Dio get baseDio => Dios.instance.baseDio;

  AuthApi? _authApi;

  AuthApi get authApi => _authApi ??= AuthApi(baseDio);

  GameApi? _gameApi;

  GameApi get gameApi => _gameApi ?? GameApi(baseDio);

  PlayerApi? _playerApi;

  PlayerApi get playerApi => _playerApi ?? PlayerApi(baseDio);
}
