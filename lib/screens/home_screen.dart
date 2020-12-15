// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/screens/screens.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: Container(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
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
            ),
            centerTitle: false,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: buildCreatePostContainer(context),
          ),
          posts.length != 0
              ? SliverList(
                  delegate: buildPostListSliverChildBuilderDelegate(),
                )
              : SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Center(
                      child: Text('Não há nada para ser demonstrado aqui.'),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Container buildCreatePostContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 8.0,
        right: 8.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostScreen(
                post: new Post(
                  id: posts.length + 1,
                  user: currentUser,
                  caption: '',
                  image: '',
                  timeAgo: DateTime.now(),
                  location: 'Marília - SP',
                  likes: [],
                  comments: [],
                ),
              ),
            ),
          ).then((value) {
            addPost(value);
          });
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: currentUser.image),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Descreva aqui',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageScreen(
                            previousScreen: false,
                          ),
                        ),
                      ).then((value) {
                        addPost(value);
                      });
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.lightGreen[700],
                    ),
                    label: Text(
                      'Foto/vídeo',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationScreen(),
                      ),
                    ),
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Localização',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addPost(value) {
    if (value != null) {
      setState(() {
        posts.add(value);
        posts.sort((a, b) => a.timeAgo.isAfter(b.timeAgo) ? -1 : 1);
      });
    }
  }

  SliverChildBuilderDelegate buildPostListSliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) {
        final Post post = posts[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          padding: EdgeInsets.only(
            bottom: post == posts[posts.length - 1] ? 5.0 : 0.0,
          ),
          child: PostContainer(
            index: index,
            post: post,
          ),
        );
      },
      childCount: posts.length,
    );
  }
}
