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

class CreatePostScreen extends StatefulWidget {
  final Post post;
  final String image;
  final String location;

  CreatePostScreen({
    Key key,
    @required this.post,
    this.image,
    this.location,
  }) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool isLoading = true;

  TextEditingController _controllerCaption = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.image != null && widget.image != '') {
      widget.post.image = widget.image;
    }
    if (widget.location != null && widget.location != '') {
      widget.post.location = widget.location;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImagesScreen(),
                          ),
                        ).then((value) {
                          if (value != null && value != '') {
                            setState(() {
                              widget.post.image = value;
                            });
                          }
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
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.scaffold,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            floating: true,
            centerTitle: false,
            titleSpacing: 10,
            title: Text(
              "Criar publicação",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                onPressed: () {
                  Navigator.pop(context, widget.post);
                },
                child: Text(
                  "Publicar",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ProfileAvatar(
                        imageUrl: currentUser.image,
                      ),
                    ),
                    title: Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _controllerCaption,
                        maxLines: null,
                        minLines:
                            widget.post.image != null && widget.post.image != ''
                                ? 2
                                : 10,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Descreva aqui',
                        ),
                        onChanged: (value) {
                          widget.post.caption = value;
                        },
                      ),
                    ),
                    widget.post.image != null && widget.post.image != ''
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Image.file(
                              File(widget.post.image),
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
