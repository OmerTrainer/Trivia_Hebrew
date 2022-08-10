import 'package:flutter/material.dart';

class FacebookUser extends ChangeNotifier {
  String name = '';
  String email = '';
  String imageUrl = '';
  bool isLoggedIn = false;

  void setName(String facebookName) {
    name = facebookName;
    notifyListeners();
  }

  void setEmail(String facebookEmail) {
    email = facebookEmail;
    notifyListeners();
  }

  void setImage(String facebookImage) {
    imageUrl = facebookImage;
    notifyListeners();
  }

  void setIsLoggedIn() {
    isLoggedIn = true;
    notifyListeners();
  }
}
