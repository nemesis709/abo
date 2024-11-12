import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IService {
  AuthRepository._privateConstructor() {
    MainService.instance.registerService(this);
  }

  static final AuthRepository _instance = AuthRepository._privateConstructor();

  static AuthRepository get instance => _instance;

  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<User?> userState() {
    return auth.authStateChanges();
  }

  Future<User?> currentUser() async {
    return auth.currentUser;
  }

  Future<Result<void>> signOut() async {
    return Result.guardFuture(() async {
      auth.setPersistence(Persistence.NONE);
      return await auth.signOut();
    });
  }

  Future<Result<UserCredential>> signIn(
      String email, String pw, bool persistence) async {
    return Result.guardFuture(() async {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: pw,
      );

      if (persistence == true) {
        auth.setPersistence(Persistence.LOCAL);
      } else {
        auth.setPersistence(Persistence.NONE);
      }

      return result;
    });
  }

  Future<Result<UserCredential>> signUp(
      String email, String pw, String name) async {
    return Result.guardFuture(() async {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pw,
      );

      await auth.currentUser?.updateDisplayName(name);

      await fireStore.collection('user').add(
          {'email': email, 'name': name, 'uid': credential.user?.uid ?? ''});

      /// TODO alert global
      return credential;
    });
  }

  @override
  void clearCache() {}
}
