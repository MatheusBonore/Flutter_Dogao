import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/screens/screens.dart';

// import 'package:flutter_dogao/widgtes/widgtes.dart';

class ImagesScreen extends StatefulWidget {
  final bool previousScreen;

  const ImagesScreen({
    Key key,
    this.previousScreen = true,
  }) : super(key: key);

  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  bool isLoading = true;

  List<FileModel> files;
  FileModel selectedFile;
  String image;

  Future<void> getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = await jsonDecode(imagePath) as List;

    files = images?.map<FileModel>((e) => FileModel.fromJson(e))?.toList();

    if (files != null && files.length > 0)
      setState(() {
        selectedFile = files[0];
        image = files[0].files[0];

        isLoading = false;
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: !isLoading
                ? DropdownButtonHideUnderline(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: DropdownButton<FileModel>(
                        isExpanded: true,
                        items: getImages(),
                        onChanged: (FileModel value) {
                          assert(value.files.length > 0);
                          image = value.files[0];
                          setState(() {
                            selectedFile = value;
                          });
                        },
                        value: selectedFile,
                      ),
                    ),
                  )
                : const SizedBox(),
            elevation: 0.0,
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
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
                child: Text(
                  'Avançar',
                  style: TextStyle(
                    color: Palette.dogaoRed,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.45,
            flexibleSpace: DecoratedBox(
              decoration: !isLoading && image != null && image != ''
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(image)),
                        fit: BoxFit.cover,
                      ),
                    )
                  : BoxDecoration(color: Colors.grey[300]),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Container(
                  decoration: BoxDecoration(
                    color: Palette.scaffold,
                  ),
                  child: !isLoading && image != null && image != ''
                      ? Image.file(
                          File(image),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width,
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var file = selectedFile.files[index];
                return Container(
                  color: Palette.scaffold,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Palette.scaffold,
                      ),
                    ),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(image == file ? 0.2 : 1),
                              BlendMode.dstATop,
                            ),
                            image: FileImage(File(file)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          image = file;
                        });
                      },
                    ),
                  ),
                );
              },
              childCount: !isLoading
                  ? selectedFile.files.length >= 10
                      ? 10
                      : selectedFile.files.length
                  : 0,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<FileModel>> getImages() {
    return files
        ?.map((e) => DropdownMenuItem(
              child: Text(
                e.folder,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              value: e,
            ))
        ?.toList();
  }
}
