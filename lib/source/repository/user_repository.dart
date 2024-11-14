import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository implements IService {
  UserRepository._privateConstructor() {
    _playerList = SimpleCache<List<UserModel>>();
  }

  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  late final SimpleCache<List<UserModel>> _playerList;

  Future<Result<List<UserModel>>> getUserList() async {
    return Result.guardFuture(() async {
      return _playerList.getAsync(create: () async {
        final result = await fireStore.collection('user').doc('info').collection('info').get();
        final statResult = await fireStore.collection('user').doc('info').collection('stat').get();
        final data = result.docs;
        final stats = statResult.docs;

        final list = <UserModel>[];

        for (var element in data) {
          final model = UserModel.fromJson(element.data());
          final stat = UserStatModel.fromJson(stats.firstWhere((e) => e.data()['uid'] == model.uid).data());

          list.add(model.copyWith(stat: stat));
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
