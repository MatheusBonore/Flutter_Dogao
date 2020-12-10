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

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CircleButton({
    Key key,
    @required this.icon,
    @required this.iconSize,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Palette.dogaoDark,
        onPressed: onPressed,
      ),
    );
  }
}
