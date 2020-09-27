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
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: PostContainer(
                post: post,
                isView: true,
              ),
            ),
            SizedBox(height: 10.0),
            post.comments.length > 0
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: post.comments.length,
                      itemBuilder: (context, index) {
                        final Comment comment = post.comments[index];
                        return CommentContainer(comment: comment);
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 65.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
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
                hintText: 'Adicionar um comentario',
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 1.0),
                  child: ProfileAvatar(imageUrl: currentUser.imageUrl),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 1.0),
                  width: 60.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Postar comentario'),
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
    );
  }
}

class CommentContainer extends StatelessWidget {
  final Comment comment;

  const CommentContainer({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: ProfileAvatar(imageUrl: comment.user.imageUrl),
        title: Text(
          comment.user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(comment.text),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.grey,
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Curtir comentario'),
          )),
        ),
      ),
    );
  }
}
