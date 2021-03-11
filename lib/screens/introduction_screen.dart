import 'package:flutter/material.dart';
import 'package:flutter_dogao/config/palette.dart';
import 'package:flutter_dogao/screens/screens.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to Dogão, Let\'s shop!',
      'image': 'assets/image/splash_1.png',
    },
    {
      'text': 'Welcome to Dogão, Let\'s shop!',
      'image': 'assets/image/splash_1.png',
    },
    {
      'text': 'Welcome to Dogão, Let\'s shop!',
      'image': 'assets/image/splash_1.png',
    },
    {
      'text': 'Welcome to Dogão, Let\'s shop!',
      'image': 'assets/image/splash_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => _splashContentWidget(
                    splashData[index]['text'],
                    splashData[index]['image'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 3),
                      SizedBox(
                        width: double.infinity,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          color: Palette.dogaoRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Continuar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _splashContentWidget(String text, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo.png',
              width: 45.0,
            ),
            Text(
              'Dogão',
              style: const TextStyle(
                color: Palette.dogaoDark,
                fontSize: 28.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 320,
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Palette.dogaoRed : Colors.grey[350],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
