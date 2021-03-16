import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

class User {
  int id;
  String name;
  String lastName;
  String image;
  Login login;

  User({
    @required this.id,
    @required this.name,
    @required this.lastName,
    this.image,
    @required this.login,
  });
}
