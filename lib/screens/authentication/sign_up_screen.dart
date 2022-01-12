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

class SignUpScreen extends StatefulWidget {
  final Data data;

  const SignUpScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageController _pageController = PageController();

  String _messageErrorNomeSobrenome;
  String _messageErrorEmail;
  String _messageErrorSenha;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobrenome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     if (_pageController.page == 0)
        //       Navigator.pop(context);
        //     else {
        //       int page = _pageController.page.toInt() > 0
        //           ? _pageController.page.toInt() - 1
        //           : 0;
        //       changePage(
        //         pageController: _pageController,
        //         page: page,
        //       );
        //     }
        //   },
        // ),
        elevation: 0.0,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  buildColumnCriarConta(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Text(
                          'Qual seu nome?',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _messageErrorNomeSobrenome != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _messageErrorNomeSobrenome,
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
                                  controller: _controllerNome,
                                  autofillHints: [AutofillHints.name],
                                  keyboardType: TextInputType.name,
                                  maxLength: 18,
                                  labelText: 'Nome',
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 40.0,
                                child: TextForm(
                                  controller: _controllerSobrenome,
                                  autofillHints: [AutofillHints.name],
                                  keyboardType: TextInputType.name,
                                  maxLength: 18,
                                  labelText: 'Sobrenome',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
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
                                  _messageErrorNomeSobrenome =
                                      validatorNomeSobrenome(
                                    nome: _controllerNome,
                                    sobrenome: _controllerSobrenome,
                                  );
                                });

                                if (_messageErrorNomeSobrenome == null ||
                                    _messageErrorNomeSobrenome.isEmpty) {
                                  changePage(
                                    pageController: _pageController,
                                    page: 1,
                                  );
                                }
                              },
                              child: Text(
                                'Avançar',
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
            ),
          ),
          Container(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  buildColumnCriarConta(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Text(
                          'Qual seu e-mail?',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                          child: SizedBox(
                            height: 38,
                            child: TextForm(
                              controller: _controllerEmail,
                              autofillHints: [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
                              maxLength: 35,
                              labelText: 'E-mail',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
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
                                  changePage(
                                    pageController: _pageController,
                                    page: 2,
                                  );
                                }
                              },
                              child: Text(
                                'Avançar',
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
            ),
          ),
          Container(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  buildColumnCriarConta(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Text(
                          'Qual sua senha?',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                          child: SizedBox(
                            height: 38,
                            child: TextForm(
                              controller: _controllerSenha,
                              autofillHints: [AutofillHints.password],
                              keyboardType: TextInputType.visiblePassword,
                              maxLength: 25,
                              labelText: 'Senha',
                              obscureText: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
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
                                  );
                                });

                                if (_messageErrorSenha == null ||
                                    _messageErrorSenha.isEmpty) {
                                  int id = widget.data.users.length + 1;
                                  widget.data.users.add(new User(
                                    id: id,
                                    name: _controllerNome.text,
                                    lastName: _controllerSobrenome.text,
                                    login: new Login(
                                      login: _controllerEmail.text,
                                      senha: _controllerSenha.text,
                                    ),
                                  ));

                                  widget.data.config.setCurrentUser(
                                      widget.data.users.firstWhere(
                                          (element) => element.id == id));

                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => NavScreen(
                                        data: widget.data,
                                      ),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                }
                              },
                              child: Text(
                                'Concluir',
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
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnCriarConta() {
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
      ],
    );
  }

  String validatorNomeSobrenome({
    TextEditingController nome,
    TextEditingController sobrenome,
  }) {
    if (nome.text.isEmpty && sobrenome.text.isEmpty) {
      return 'Informe seu nome e sobrenome.';
    } else if (nome.text.isEmpty) {
      return 'Informe seu nome.';
    } else if (sobrenome.text.isEmpty) {
      return 'Informe seu sobrenome.';
    }
    return null;
  }

  String validatorEmail({TextEditingController email}) {
    if (email.text.isEmpty) {
      return 'Informe seu e-mail.';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      return 'E-mail informado é invalido.';
    } else if (widget.data.users.indexWhere(
          (element) => element.login.login == email.text,
        ) ==
        0) {
      return 'E-mail informado em uso.';
    }
    return null;
  }

  String validatorSenha({TextEditingController senha}) {
    if (senha.text.isEmpty) {
      return 'Informe sua senha.';
    }
    return null;
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
