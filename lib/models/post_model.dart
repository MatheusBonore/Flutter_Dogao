import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

class Post {
  final int id;
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final List<User> likes;
  final List<Comment> comments;

  const Post({
    @required this.id,
    @required this.user,
    @required this.caption,
    @required this.timeAgo,
    @required this.imageUrl,
    this.likes,
    this.comments,
  });
}
