// ignore: unused_import
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_dogao/screens/screens.dart';
// ignore: unused_import
import 'package:flutter_dogao/config/palette.dart';
// ignore: unused_import
import 'package:flutter_dogao/data/data.dart';
// ignore: unused_import
import 'package:flutter_dogao/models/models.dart';
// ignore: unused_import
import 'package:flutter_dogao/widgtes/widgtes.dart';

// ignore: unused_import
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  final Data data;

  const SignInScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  PageController _pageController = PageController();

  String _messageErrorEmail;
  String _messageErrorSenha;

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  String name = '';
  String foto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: [
              Spacer(),
              buildColumnEntrar(hideMore: false),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _messageErrorEmail != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _messageErrorEmail,
                                  style: TextStyle(
                                    color: Palette.dogaoRed,
                                  ),
                                ),
                                Icon(
                                  Icons.error,
                                  color: Palette.dogaoRed,
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                    Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: TextForm(
                              controller: _controllerEmail,
                              autofillHints: [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
                              maxLength: 35,
                              labelText: 'E-mail',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 20.0,
                            ),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Text(
                                'Esqueceu seu e-mail?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              height: 40.0,
                              color: Palette.dogaoRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {
                                setState(() {
                                  _messageErrorEmail = validatorEmail(
                                    email: _controllerEmail,
                                  );
                                });

                                if (_messageErrorEmail == null ||
                                    _messageErrorEmail.isEmpty) {
                                  setState(() {
                                    name = widget.data.users
                                        .firstWhere((element) =>
                                            element.login.login ==
                                            _controllerEmail.text)
                                        .name;
                                    foto = widget.data.users
                                        .firstWhere((element) =>
                                            element.login.login ==
                                            _controllerEmail.text)
                                        .image;
                                  });

                                  changePage(
                                    pageController: _pageController,
                                    page: 1,
                                  );
                                }
                              },
                              child: Text(
                                'Continuar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              buildColumnContas(context),
              Spacer(),
            ],
          ),
          Column(
            children: [
              Spacer(),
              buildColumnEntrar(hideMore: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ProfileAvatar(
                        name: name,
                        imageUrl: foto,
                        radius: 60.0,
                        viewProfile: false,
                      ),
                    ),
                    Text(
                      'Olá $name',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(_controllerEmail.text),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _messageErrorSenha != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _messageErrorSenha,
                                  style: TextStyle(
                                    color: Palette.dogaoRed,
                                  ),
                                ),
                                Icon(
                                  Icons.error,
                                  color: Palette.dogaoRed,
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                    Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: TextForm(
                              controller: _controllerSenha,
                              autofillHints: [AutofillHints.password],
                              keyboardType: TextInputType.visiblePassword,
                              maxLength: 25,
                              labelText: 'Senha',
                              obscureText: true,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 20.0,
                            ),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              height: 40.0,
                              color: Palette.dogaoRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {
                                setState(() {
                                  _messageErrorSenha = validatorSenha(
                                    senha: _controllerSenha,
                                    email: _controllerEmail,
                                  );
                                });

                                widget.data.config.setCurrentUser(
                                  widget.data.users.firstWhere(
                                    (element) =>
                                        element.login.login ==
                                            _controllerEmail.text &&
                                        element.login.senha ==
                                            _controllerSenha.text,
                                  ),
                                );

                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => NavScreen(
                                      data: widget.data,
                                    ),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }

  Column buildColumnContas(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialCard(
              svg: 'assets/svg/google.svg',
              press: () {},
            ),
            buildSocialCard(
              svg: 'assets/svg/facebook.svg',
              press: () {},
            ),
            buildSocialCard(
              svg: 'assets/svg/twitter.svg',
              press: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Não tem uma conta? '),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(
                        data: widget.data,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildColumnEntrar({bool hideMore}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo.png',
              width: 45.0,
            ),
            Text(
              Palette.name,
              style: TextStyle(
                color: Palette.dogaoDark,
                fontSize: 28.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: !hideMore
              ? Column(
                  children: [
                    Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 18.0,
                      ),
                      child: Text(
                        'Use sua conta do ${Palette.name}. ' +
                            'Você também fará parte' +
                            ' de uma comunidade apaixonada' +
                            ' por animais de estimação.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ],
    );
  }

  String validatorEmail({TextEditingController email}) {
    if (email.text.isEmpty) {
      return 'Informe seu e-mail.';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      return 'E-mail informado é invalido.';
    } else if (widget.data.users
            .indexWhere((element) => element.login.login == email.text) !=
        0) {
      return 'E-mail não utilizado.';
    }
    return null;
  }

  String validatorSenha(
      {TextEditingController senha, TextEditingController email}) {
    if (senha.text.isEmpty) {
      return 'Informe sua senha.';
    } else if (widget.data.users.indexWhere((element) =>
            element.login.login == email.text &&
            element.login.senha == senha.text) !=
        0) {
      return 'Senha não confere com e-mail.';
    }
    return null;
  }

  GestureDetector buildSocialCard({String svg, Function press}) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(4),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(svg),
      ),
    );
  }

  void changePage({PageController pageController, int page}) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        page.toInt(),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
