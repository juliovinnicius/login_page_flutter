import 'dart:convert';

import '../../domain/entites/user_entity.dart';

class UserLoginAdapter {
  static Future<Map<String, dynamic>> toMap(UserEntity entity) async {
    return {
      'email': entity.email,
      'pass': entity.pass,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'],
      pass: map['pass'],
    );
  }

  static String toJson(UserEntity entity) => json.encode(toMap(entity));

  static UserEntity fromJSON(String source) => fromMap(jsonDecode(source));
}
