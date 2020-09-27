import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

class Comment {
  final int id;
  final User user;
  final String text;

  const Comment({
    @required this.id,
    @required this.user,
    @required this.text,
  });
}
