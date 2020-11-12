import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/screens/screens.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  final bool isView;

  const PostContainer({
    Key key,
    @required this.post,
    this.isView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: !isView
          ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0)
          : const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PostTop(post: post),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(post.caption),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: PostImage(post: post, isView: isView),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: PostButtons(post: post),
          ),
        ],
      ),
    );
  }
}

class PostTop extends StatelessWidget {
  final Post post;

  const PostTop({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ProfileAvatar(
          imageUrl: post.user.imageUrl,
          isActive: post.user.online,
        ),
      ),
      title: Text(
        post.user.name,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          Text(
            '${post.timeAgo} • ',
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
            '${post.pet.location}',
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
    );
  }
}

class PostImage extends StatelessWidget {
  final Post post;
  final bool isView;

  const PostImage({
    Key key,
    @required this.post,
    @required this.isView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return post.pet.imageUrl != null
        ? InkWell(
            onDoubleTap: () => Scaffold.of(context).showSnackBar(SnackBar(
              content: const Text('Curtir'),
            )),
            onTap: () {
              if (!isView) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewPetScreen(
                      currentUser: currentUser,
                      post: post,
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: post.pet.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class PostButtons extends StatefulWidget {
  final Post post;

  const PostButtons({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  _PostButtonsState createState() => _PostButtonsState();
}

class _PostButtonsState extends State<PostButtons> {
  bool likes({User currentUser, Post post}) {
    return post.likes.contains(currentUser);
  }

  void doLike({User currentUser, Post post}) {
    setState(() {
      if (likes(currentUser: currentUser, post: post)) {
        post.likes.remove(currentUser);
      } else {
        post.likes.add(currentUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLiked = likes(currentUser: currentUser, post: widget.post);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlatButton.icon(
              onPressed: () => {
                doLike(
                  currentUser: currentUser,
                  post: widget.post,
                )
              },
              icon: isLiked
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
              label: isLiked
                  ? Text(
                      '${widget.post.likes.length}',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : Text(
                      '${widget.post.likes.length}',
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
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewPostScreen(
                      currentUser: currentUser,
                      post: widget.post,
                    ),
                  ),
                ),
              },
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey,
              ),
              label: Text(
                '${widget.post.comments.length}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: FlatButton.icon(
                onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    widget.post.pet.category == Category.find
                        ? "Encontrado"
                        : widget.post.pet.category == Category.donation
                            ? "Doação"
                            : "Perdido",
                  ),
                )),
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20.0,
                ),
                label: Text(
                  widget.post.pet.category == Category.find
                      ? "Encontrado"
                      : widget.post.pet.category == Category.donation
                          ? "Doação"
                          : "Perdido",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: widget.post.pet.category == Category.find
                    ? Colors.lightGreen[700]
                    : widget.post.pet.category == Category.donation
                        ? Colors.orange[700]
                        : Palette.dogaoRed,
              ),
            )
          ],
        ),
      ],
    );
  }
}
