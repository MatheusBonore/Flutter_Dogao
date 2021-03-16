// import 'dart:convert';
// import 'dart:io';
// import 'dart:ui';

import 'package:flutter/material.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

// import 'package:flutter_dogao/screens/screens.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class ViewPostScreen extends StatelessWidget {
  final Config config;
  final User currentUser;
  final Post post;

  const ViewPostScreen({
    Key key,
    @required this.config,
    @required this.currentUser,
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
                config: config,
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
