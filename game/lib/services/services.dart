import 'package:flutter/material.dart';
import 'package:game/interfaces/user.dart';
import 'package:http/http.dart';
import 'dart:convert';

import './http_service.dart';

class Services {
  static HttpService http = HttpService();

  static Future<User?> createUser(BuildContext context, User user) async {
    Response response = await http.post('users/create', user.toJson(), context);
    if (response.statusCode == 200) {
      dynamic userJson = jsonDecode(response.body)['data'];
      return User.fromJson(userJson);
    } else {
      return null;
    }
  }
}
