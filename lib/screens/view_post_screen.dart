import 'package:flutter/material.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class ViewPostScreen extends StatelessWidget {
  final User currentUser;
  final Post post;

  const ViewPostScreen({
    Key key,
    @required this.currentUser,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 65.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white70),
                ),
                contentPadding: EdgeInsets.all(1.0),
                hintText: 'Escrever comentario',
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 1.0),
                  child: ProfileAvatar(
                    imageUrl: currentUser.imageUrl,
                  ),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 1.0),
                  width: 60.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                      content: const Text('Postar comentario'),
                    )),
                    child: Icon(
                      Icons.send,
                      size: 25.0,
                      color: Palette.dogaoRed,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: false,
            titleSpacing: -5,
            title: PostTop(post: post),
          ),
          SliverToBoxAdapter(
            child: PostImage(post: post, isView: true),
          ),
        ],
      ),
    );
  }
}
