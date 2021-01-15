import 'dart:convert';
// import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dogao/widgtes/widgtes.dart';

import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/screens/screens.dart';

// import 'package:flutter_dogao/widgtes/widgtes.dart';

class ImageScreen extends StatefulWidget {
  final bool previousScreen;

  const ImageScreen({
    Key key,
    this.previousScreen = true,
  }) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  ModalBottomSheet modalBottomSheet = new ModalBottomSheet();
  bool isLoading = true;

  List<FileModel> files = <FileModel>[];
  FileModel selectedFile = new FileModel();
  String image;

  Future<void> getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = await jsonDecode(imagePath) as List;

    files = images?.map<FileModel>((e) => FileModel.fromJson(e))?.toList();

    if (files != null && files.length > 0)
      setState(() {
        image = files[0].files[0];
        isLoading = false;
      });

    setState(() {
      files.insert(0, new FileModel(files: [], folder: 'Galeria'));
      files.insert(1, new FileModel(files: [], folder: 'Outro...'));
      selectedFile = files[0];
    });
  }

  @override
  void initState() {
    super.initState();
    getImagesPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => modalBottomSheet.mainBottomSheet(
            context,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: files.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(files[index].folder),
                  onTap: () {
                    if (!files[index].folder.contains('Galeria') &&
                        !files[index].folder.contains('Outro...')) {
                      assert(files[index].files.length > 0);
                      image = files[index].files[0];
                    }

                    setState(() {
                      selectedFile = files[index];
                    });

                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          child: Row(
            children: [
              Text(
                selectedFile.folder ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        elevation: 0.0,
        actions: [
          !isLoading
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Palette.dogaoRed,
                  ),
                  onPressed: () {
                    if (widget.previousScreen) {
                      Navigator.pop(context, image);
                    } else {
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
                            image: image,
                          ),
                        ),
                      ).then((value) {
                        Navigator.pop(context, value);
                      });
                    }
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Palette.dogaoRed,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraScreen(),
                      ),
                    );
                  },
                ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: null,
      ),
    );
  }
}
