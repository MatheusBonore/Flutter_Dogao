import 'package:meta/meta.dart';

class Login {
  String login;
  String senha;
  bool online;

  Login({
    @required this.login,
    @required this.senha,
    this.online,
  });
}
