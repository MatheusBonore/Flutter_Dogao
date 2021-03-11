import 'package:flutter/material.dart';
import 'package:flutter_dogao/config/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Use sua conta do Dogão. ' +
                        'Você também fará parte' +
                        ' de uma comunidade apaixonada' +
                        ' por animais de estimação.',
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 38,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'E-mail ou telefone',
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.grey[350],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.grey[350],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                            color: Palette.dogaoRed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {
                              print('Flatbutton');
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Não tem uma conta? '),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          'Criar conta',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
