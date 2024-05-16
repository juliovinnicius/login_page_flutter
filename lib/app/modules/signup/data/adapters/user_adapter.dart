import 'dart:convert';

import 'package:login_page_flutter/app/modules/signup/domain/entites/user_entity.dart';

class UserAdapter {
  static Future<Map<String, dynamic>> toMap(UserEntity entity) async {
    return {
      'name': entity.name,
      'email': entity.email,
      'pass': entity.pass,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'],
      email: map['email'],
      pass: map['pass'],
    );
  }

  static String toJson(UserEntity entity) => json.encode(toMap(entity));

  static UserEntity fromJSON(String source) => fromMap(jsonDecode(source));
}
