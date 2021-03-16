import 'package:flutter/material.dart';

import 'user_model.dart';

class Config {
  bool introduction;
  User currentUser;

  void setIntroduction(bool i) {
    this.introduction = i;
  }

  Config({
    @required this.introduction,
    this.currentUser,
  });
}
