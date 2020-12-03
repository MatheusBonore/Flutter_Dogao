import 'package:flutter/material.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class CreatePostScreen extends StatelessWidget {
  final List<Post> posts;

  CreatePostScreen({
    Key key,
    @required this.posts,
  }) : super(key: key);

  final TextEditingController _controllerCaption = TextEditingController();

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
                  final Post post = Post(
                    id: posts.length + 1,
                    user: currentUser,
                    caption: _controllerCaption.text,
                    timeAgo: new DateTime.now(),
                  );

                  Navigator.pop(context, post);
                },
                child: Text(
                  "Publicar",
                  style: TextStyle(
                    fontSize: 18,
                    // color: Colors.grey,
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
                        imageUrl: currentUser.imageUrl,
                        isActive: currentUser.online,
                      ),
                    ),
                    title: Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _controllerCaption,
                    maxLines: null,
                    minLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Descreva aqui',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
