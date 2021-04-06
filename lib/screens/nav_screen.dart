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

class NavScreen extends StatefulWidget {
  final Data data;

  const NavScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> _screens = [];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.pets,
    MdiIcons.bell,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(
        data: widget.data,
      ),
      CategoryScreen(),
      Scaffold(),
      Scaffold(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: true == false ? 12.0 : 0),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.dogaoRed,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color:
                      i == selectedIndex ? Palette.dogaoRed : Palette.dogaoDark,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
