import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

class Post {
  final int id;
  final User user;
  final Pet pet;
  final String caption;
  final String timeAgo;
  final List<User> likes;
  final List<Comment> comments;

  const Post({
    @required this.id,
    @required this.user,
    @required this.pet,
    @required this.caption,
    @required this.timeAgo,
    this.likes,
    this.comments,
  });
}
