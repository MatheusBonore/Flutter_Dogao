import 'package:flutter_dogao/models/models.dart';

final List<User> users = [
  User(
    id: 1,
    name: 'Matheus Henrique Conceição Bonore',
    image:
        'https://scontent.fmii2-1.fna.fbcdn.net/v/t1.0-9/99055632_158647448972525_3629662387809812480_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=QKQ6P3FmUNsAX_zMT1S&_nc_ht=scontent.fmii2-1.fna&oh=81eacf7a3e3ce07e0c09c280cf007dc0&oe=5FEF8DAE',
    online: true,
  ),
];

final User currentUser = users[0];

final List<Pet> pets = [];

final List<Comment> comments = [];

final List<Post> posts = [];
