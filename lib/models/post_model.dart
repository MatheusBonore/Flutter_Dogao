import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

class Post {
  int id;
  User user;
  Pet pet;
  String caption;
  String image;
  DateTime timeAgo;
  String location;
  List<User> likes;
  List<Comment> comments;

  Post({
    @required this.id,
    @required this.user,
    this.pet,
    @required this.caption,
    this.image,
    @required this.timeAgo,
    @required this.location,
    @required this.likes,
    @required this.comments,
  });
}
