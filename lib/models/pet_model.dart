import 'package:meta/meta.dart';

class Pet {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final int age;
  final String sex;
  final String color;

  Pet({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.description,
    @required this.age,
    @required this.sex,
    @required this.color,
  });
}
