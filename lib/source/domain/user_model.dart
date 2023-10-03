class UserModel {
  final String email;
  final String name;
  final String uid;

  UserModel({
    required this.email,
    required this.name,
    required this.uid,
  });

  Map toJson() => {
        'email': email,
        'name': name,
        'uid': uid,
      };

  static UserModel fromJson(Map json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      uid: json['uid'],
    );
  }
}
