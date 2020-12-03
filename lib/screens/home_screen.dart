import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

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
            child: Container(
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
                      builder: (context) => CreatePostScreen(posts: posts),
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        posts.add(value);
                        posts.sort(
                            (a, b) => a.timeAgo.isAfter(b.timeAgo) ? -1 : 1);
                      });
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: CachedNetworkImageProvider(
                              currentUser.imageUrl,
                            ),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.lightGreen[700],
                                ),
                                Text(
                                  'Foto/vídeo',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Localização',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
