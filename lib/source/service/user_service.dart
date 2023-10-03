import 'package:abo/common/data/result.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService implements IService {
  UserService._privateConstructor() {}

  static final UserService _instance = UserService._privateConstructor();

  static UserService get instance => _instance;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<Result<List<UserModel>>> getUserList() async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('user')
          .get();
      final data = result.docs;

      final list = <UserModel>[];

      for (var element in data) {
        list.add(UserModel.fromJson(element.data()));
      }

      return list;
    });
  }

  @override
  void clearCache() {}
}
