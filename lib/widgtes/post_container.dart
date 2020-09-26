import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/config/palette.dart';
import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  final List<List> _category = const [
    [Palette.dogaoComunidade, 'Comunidade'],
    [Palette.dogaoAchados, 'Sou dono'],
    [Palette.dogaoDoacao, 'Adotar'],
    [Palette.dogaoPerdidos, 'Encontrei'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
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
              PostHeader(post: post, category: _category),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(post.caption),
              ),
              post.imageUrl != null
                  ? const SizedBox.shrink()
                  : const SizedBox(height: 6.0),
            ],
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl,
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PostStats(post: post, category: _category),
          ),
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;
  final List<List> category;

  const PostHeader({
    Key key,
    @required this.post,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ProfileAvatar(imageUrl: post.user.imageUrl),
        ),
        title: Text(
          post.user.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
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
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Mais'),
          )),
        ),
      ),
    );
  }
}

class PostStats extends StatefulWidget {
  final Post post;
  final List<List> category;

  const PostStats({
    Key key,
    @required this.post,
    @required this.category,
  }) : super(key: key);

  @override
  _PostStatsState createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
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
              onPressed: () =>
                  {doLike(currentUser: currentUser, post: widget.post)},
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
              onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Comentar'),
              )),
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey,
              ),
              label: Text(
                '${widget.post.comments}',
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
                  content: Text(widget.category[widget.post.category][1]),
                )),
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20.0,
                ),
                label: Text(
                  widget.category[widget.post.category][1],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: widget.category[widget.post.category][0],
              ),
            )
          ],
        ),
      ],
    );
  }
}
