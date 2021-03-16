import 'package:flutter/material.dart';

class Config {
  bool introduction;

  void setIntroduction(bool i) {
    this.introduction = i;
  }

  Config({
    @required this.introduction,
  });
}
