import 'package:meta/meta.dart';
import 'package:flutter_dogao/models/models.dart';

enum Category {
  none,
  donation,
  find,
  lost,
}

enum Species {
  cat,
  bunny,
  dog,
  hamster,
}

class Pet {
  final int id;
  final User user;
  final String timeAgo;
  final Category category;
  final String name;
  final String imageUrl;
  final String description;
  final int age;
  final String sex;
  final String color;
  final Species specie;
  final String location;

  Pet({
    @required this.id,
    @required this.user,
    @required this.timeAgo,
    @required this.category,
    @required this.name,
    @required this.imageUrl,
    @required this.description,
    @required this.age,
    @required this.sex,
    @required this.color,
    @required this.specie,
    @required this.location,
  });
}
