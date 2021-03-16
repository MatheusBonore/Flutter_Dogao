// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

// import 'package:flutter_dogao/screens/screens.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class SignUpScreen extends StatefulWidget {
  final List<User> users;

  const SignUpScreen({
    Key key,
    @required this.users,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageController _pageController = PageController();

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobrenome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  List<Column> splashData = [];

  @override
  void initState() {
    super.initState();

    splashData = [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Qual seu nome?',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                SizedBox(
                  height: 38,
                  child: TextForm(
                    controller: _controllerNome,
                    labelText: 'Nome',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 38,
                  child: TextForm(
                    controller: _controllerSobrenome,
                    labelText: 'Sobrenome',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Qual seu e-mail?',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: SizedBox(
              height: 38,
              child: TextForm(
                controller: _controllerEmail,
                labelText: 'E-mail',
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Qual sua senha?',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: SizedBox(
              height: 38,
              child: TextForm(
                controller: _controllerSenha,
                labelText: 'Senha',
                obscureText: true,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_pageController.page == 0)
              Navigator.pop(context);
            else {
              var page =
                  _pageController.page > 0 ? _pageController.page - 1 : 0;
              changePage(_pageController, page);
            }
          },
        ),
        elevation: 0.0,
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: splashData.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/logo.png',
                      width: 45.0,
                    ),
                    Text(
                      'Dogão',
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
                  child: Column(
                    children: [
                      Text(
                        'Criar conta',
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
                          'Ajudaremos você a criar uma nova ' +
                              'conta em algumas etapas simples.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      splashData[index],
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          width: double.infinity,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            color: Palette.dogaoRed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {
                              if (_pageController.page.toInt() + 1 !=
                                  splashData.length) {
                                var page = _pageController.page + 1;
                                changePage(_pageController, page);
                              } else {
                                widget.users.add(
                                  new User(
                                    id: widget.users.length + 1,
                                    name: _controllerNome.text,
                                    lastName: _controllerSobrenome.text,
                                    login: new Login(
                                      login: _controllerEmail.text,
                                      senha: _controllerSenha.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              index + 1 == splashData.length
                                  ? 'Concluir'
                                  : 'Avançar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          );
        },
      ),
    );
  }

  void changePage(PageController pageController, double page) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        page.toInt(),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
