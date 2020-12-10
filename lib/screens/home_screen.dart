// import 'dart:convert';
import 'dart:io';

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
  List<bool> viewMoreCaption = [];

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
                          builder: (context) => ImagesScreen(
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
                    onPressed: () {},
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
        viewMoreCaption.add(false);

        return Padding(
          padding: EdgeInsets.only(
            bottom: post == posts[posts.length - 1] ? 5.0 : 0.0,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ProfileAvatar(
                      imageUrl: post.user.image,
                      isActive: post.user.online,
                    ),
                  ),
                  title: Text(
                    post.user.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        '${post.timeAgo} •',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.0,
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[600],
                        size: 12.0,
                      ),
                      Text(
                        post.location,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                    onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                      content: const Text('Mais'),
                    )),
                  ),
                ),
                post.caption != null && post.caption != ''
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => {
                                setState(() {
                                  if (!viewMoreCaption[index]) {
                                    viewMoreCaption[index] = true;
                                  }
                                })
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: post.caption.length >= 155
                                      ? post.caption.substring(
                                          0,
                                          !viewMoreCaption[index]
                                              ? 155
                                              : post.caption.length,
                                        )
                                      : post.caption,
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: !viewMoreCaption[index] &&
                                              post.caption.length >= 155
                                          ? '...'
                                          : null,
                                    ),
                                    TextSpan(
                                      text: !viewMoreCaption[index] &&
                                              post.caption.length >= 155
                                          ? ' Ver mais'
                                          : null,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                post.image != null && post.image != ''
                    ? Container(
                        child: Image.file(
                          File(post.image),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )
                    : const SizedBox(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton.icon(
                            onPressed: () => {
                              setState(() {
                                if (post.likes.contains(currentUser))
                                  post.likes.remove(currentUser);
                                else
                                  post.likes.add(currentUser);
                              })
                            },
                            icon: post.likes.contains(currentUser)
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                  ),
                            label: post.likes.contains(currentUser)
                                ? Text(
                                    '${post.likes.length}',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                : Text(
                                    '${post.likes.length}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          FlatButton.icon(
                            onPressed: () =>
                                {buildShowModalBottomSheetComments(context)},
                            icon: const Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.grey,
                            ),
                            label: Text(
                              'Comentar',
                              style: TextStyle(
                                color: Colors.grey,
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
              ],
            ),
          ),
        );
      },
      childCount: posts.length,
    );
  }

  Future buildShowModalBottomSheetComments(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) => Container(
        // height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          children: [
            Transform.translate(
              offset:
                  Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Palette.scaffold,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton.icon(
                            onPressed: () {},
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
                            onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
