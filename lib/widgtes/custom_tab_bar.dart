// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_dogao/data/data.dart';

// import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

// import 'package:flutter_dogao/screens/screens.dart';

// import 'package:flutter_dogao/widgtes/widgtes.dart';

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
