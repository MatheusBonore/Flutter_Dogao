import 'package:meta/meta.dart';

class User {
  int id;
  String name;
  String image;
  bool online;

  User({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.online,
  });
}
