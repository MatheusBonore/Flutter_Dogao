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
// import 'package:storage_path/storage_path.dart';

class ViewPetScreen extends StatelessWidget {
  final User currentUser;
  final Post post;

  const ViewPetScreen({
    Key key,
    @required this.currentUser,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(post, 400),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 5000,
            ),
          )
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Post post;
  final double expandedHeight;

  DetailSliverDelegate(
    this.post,
    this.expandedHeight,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.network(
          post.pet.imageUrl,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - 120 - shrinkOffset,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.pet.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    post.pet.location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: expandedHeight - 50 - shrinkOffset,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
