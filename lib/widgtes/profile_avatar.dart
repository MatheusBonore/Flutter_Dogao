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

class ProfileAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isActive;
  final double radius;
  final bool viewProfile;

  const ProfileAvatar({
    Key key,
    @required this.name,
    @required this.imageUrl,
    this.isActive = false,
    this.radius = 20.0,
    this.viewProfile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        if (viewProfile) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        }
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey[200],
            // backgroundImage: CachedNetworkImageProvider(imageUrl),
            child: Text(
              name.substring(0, 1),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0 * (radius * 0.04),
              ),
            ),
          ),
          isActive
              ? Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
