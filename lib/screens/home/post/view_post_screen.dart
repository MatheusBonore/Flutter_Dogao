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

class ViewPostScreen extends StatelessWidget {
  final Data data;

  final Post post;

  const ViewPostScreen({
    Key key,
    @required this.data,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.035,
              ),
              child: PostContainer(
                data: data,
                post: post,
                isViewPost: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
