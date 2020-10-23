import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class HomeScreen extends StatelessWidget {
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
            // actions: [
            //   CircleButton(
            //     icon: Icons.search,
            //     iconSize: 30.0,
            //     onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
            //       content: Text('Pesquisar'),
            //     )),
            //   ),
            // ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                top: 10.0,
                left: 8.0,
                right: 8.0,
                bottom: 5.0,
              ),
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            CachedNetworkImageProvider(currentUser.imageUrl),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'O que seu pet tem a dizer?',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: () =>
                              Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Foto/vídeo'),
                          )),
                          icon: Icon(
                            Icons.image,
                            color: Colors.lightGreen[700],
                          ),
                          label: Text(
                            'Foto/vídeo',
                            overflow: TextOverflow.ellipsis,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: FlatButton.icon(
                      //     onPressed: () =>
                      //         Scaffold.of(context).showSnackBar(SnackBar(
                      //       content: Text('Câmera'),
                      //     )),
                      //     icon: Icon(
                      //       Icons.camera_alt,
                      //       color: Colors.blue,
                      //     ),
                      //     label: Text(
                      //       'Câmera',
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(30.0),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: () =>
                              Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Check-in'),
                          )),
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          label: Text(
                            'Check-in',
                            overflow: TextOverflow.ellipsis,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
