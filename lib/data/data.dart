import 'package:flutter_dogao/models/models.dart';

final Config config = new Config(
  introduction: true,
);

final List<Login> logins = [
  Login(
    id: 1,
    login: 'matheus.bonore@gmail.com',
    senha: 'senha123',
  ),
];

final List<User> users = [
  User(
    id: 1,
    name: 'Matheus Henrique Conceição Bonore',
    image:
        'https://avatars1.githubusercontent.com/u/44881739?s=460&u=4ed6a4b3ebc8e47bcbe5ca0696d33381f6b26ba6&v=4',
    online: true,
    login: logins.firstWhere((element) => element.id == 1),
  ),
];

final User currentUser = users.firstWhere((element) => element.id == 1);

final List<Pet> pets = [];

final List<Comment> comments = [];

final List<Post> posts = [];
