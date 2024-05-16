import 'dart:convert';

import 'package:login_page_flutter/app/modules/home/domain/entities/person_entity.dart';

class PersonAdapter {
  static Future<Map<String, dynamic>> toMap(PersonEntity entity) async {
    return {
      'email': entity.email,
      'name': entity.name,
      'photo': entity.photo,
      'birthday': entity.birthday,
    };
  }

  static PersonEntity fromMap(Map<String, dynamic> map) {
    return PersonEntity(
      email: map['results'][0]['email'],
      name: map['results'][0]['name']['first'],
      photo: map['results'][0]['picture']['large'],
      birthday: map['results'][0]['dob']['date'],
    );
  }

  static String toJson(PersonEntity entity) => json.encode(toMap(entity));

  static PersonEntity fromJSON(String source) => fromMap(jsonDecode(source));
}
