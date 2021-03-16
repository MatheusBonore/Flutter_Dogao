import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

class User {
  int id;
  String name;
  String image;
  bool online;
  Login login;

  User({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.online,
    @required this.login,
  });
}
