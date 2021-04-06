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
  TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Column(
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
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                        child: TextForm(
                          controller: _controllerEmail,
                          autofillHints: [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 20,
                          labelText: 'E-mail ou telefone',
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
                            // print(_controllerEmail.text);

                            // print(logins.where((element) =>
                            //     element.login == _controllerEmail.text));

                            // print(logins
                            //     .map((e) => e.login == _controllerEmail.text));
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
              ),
              Spacer(flex: 1),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSocalCard(
                        svg: 'assets/svg/google.svg',
                        press: () {},
                      ),
                      buildSocalCard(
                        svg: 'assets/svg/facebook.svg',
                        press: () {},
                      ),
                      buildSocalCard(
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
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSocalCard({String svg, Function press}) {
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
}
