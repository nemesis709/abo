import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/event/event_bus.dart';
import 'package:abo/common/event/profile_event.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService implements IService {
  UserService._privateConstructor() {
    eventBus.on<ProfileEvent>().listen((event) {
      _playerList.clear();
    });

    _playerList = SimpleCache<List<UserModel>>();
  }

  static final UserService _instance = UserService._privateConstructor();

  static UserService get instance => _instance;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  late final SimpleCache<List<UserModel>> _playerList;

  Future<Result<List<UserModel>>> getUserList() async {
    return Result.guardFuture(() async {
      return _playerList.getAsync(create: () async {
        final result = await fireStore.collection('user').get();
        final data = result.docs;

        final list = <UserModel>[];

        for (var element in data) {
          list.add(UserModel.fromJson(element.data()));
        }

        return list;
      });
    });
  }

  @override
  void clearCache() {
    _playerList.clear();
  }
}
