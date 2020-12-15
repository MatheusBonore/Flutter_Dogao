// import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

// import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/screens/screens.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class PostContainer extends StatefulWidget {
  final int index;
  final Post post;
  final bool isViewPost;

  const PostContainer({
    Key key,
    this.index = 0,
    @required this.post,
    this.isViewPost = false,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.isViewPost
            ? BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              )
            : BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.isViewPost
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: buildListTile(context),
                    ),
                  ],
                )
              : buildListTile(context),
          widget.post.caption != null && widget.post.caption != ''
              ? Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(widget.post.caption),
                )
              : const SizedBox(),
          widget.post.image != null && widget.post.image != ''
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.post.image)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onDoubleTap: () => {
                      if (!widget.isViewPost)
                        {
                          setState(() {
                            if (widget.post.likes.contains(currentUser))
                              widget.post.likes.remove(currentUser);
                            else
                              widget.post.likes.add(currentUser);
                          })
                        }
                    },
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
                          if (widget.post.likes.contains(currentUser))
                            widget.post.likes.remove(currentUser);
                          else
                            widget.post.likes.add(currentUser);
                        })
                      },
                      icon: widget.post.likes.contains(currentUser)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                      label: widget.post.likes.contains(currentUser)
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewPostScreen(
                              currentUser: currentUser,
                              post: widget.post,
                            ),
                          ),
                        );
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ProfileAvatar(
          imageUrl: widget.post.user.image,
          isActive: widget.post.user.online,
        ),
      ),
      title: Text(
        widget.post.user.name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Row(
        children: [
          Container(
            width: 80.0,
            child: Text(
              '${widget.post.timeAgo} •',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.location_on,
            color: Colors.grey[600],
            size: 12.0,
          ),
          Text(
            widget.post.location,
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
