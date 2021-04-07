// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';

// ignore: unused_import
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
// ignore: unused_import
import 'package:storage_path/storage_path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Data data = new Data();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ${Palette.name} UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: _IntroScreen(
        data: data,
      ),
    );
  }
}

class _IntroScreen extends StatefulWidget {
  final Data data;

  const _IntroScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  __IntroScreenState createState() => __IntroScreenState();
}

class __IntroScreenState extends State<_IntroScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.data.config.introduction
              ? IntroductionScreen(
                  data: widget.data,
                )
              : SignInScreen(
                  data: widget.data,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/logo.png',
                      width: 90.0,
                    ),
                    Text(
                      Palette.name,
                      style: const TextStyle(
                        color: Palette.dogaoDark,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
