import 'package:meta/meta.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool online;

  const User({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.online,
  });
}
