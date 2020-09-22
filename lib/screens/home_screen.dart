import 'package:flutter/material.dart';
import 'package:flutter_dogao/config/palette.dart';
import 'package:flutter_dogao/widgtes/circle_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FlutterLogo(
                      size: 30.0,
                    ),
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
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('Search'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
