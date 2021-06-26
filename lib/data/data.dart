import 'package:flutter_dogao/models/models.dart';

class Data {
  Config config = new Config(
    introduction: true,
  );

  List<User> users = [
    new User(
      id: 1,
      name: 'Matheus Henrique',
      lastName: 'Conceição Bonore',
      login: new Login(
        login: 'matheus.bonore@gmail.com',
        senha: 'senha',
      ),
    ),
  ];

  List<Pet> pets = [];

  List<Comment> comments = [];

  List<Post> posts = [];
}
