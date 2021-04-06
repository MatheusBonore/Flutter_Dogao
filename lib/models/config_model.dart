import 'package:flutter/material.dart';

import 'user_model.dart';

class Config {
  bool introduction;
  User currentUser;

  void setIntroduction(bool i) {
    this.introduction = i;
  }

  void setCurrentUser(User user) async {
    this.currentUser = user;
  }

  Config({
    @required this.introduction,
    this.currentUser,
  });
}
