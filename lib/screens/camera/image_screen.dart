// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:flutter_dogao/screens/screens.dart';
// ignore: unused_import
import 'package:flutter_dogao/config/palette.dart';
// ignore: unused_import
import 'package:flutter_dogao/data/data.dart';
// ignore: unused_import
import 'package:flutter_dogao/models/models.dart';
// ignore: unused_import
import 'package:flutter_dogao/widgtes/widgtes.dart';

// ignore: unused_import
import 'package:flutter_svg/svg.dart';
// ignore: unused_import
// import 'package:storage_path/storage_path.dart';

class ImageScreen extends StatefulWidget {
  final Data data;
  final bool previousScreen;

  const ImageScreen({
    Key key,
    @required this.data,
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
    // var imagePath = await StoragePath.imagesPath;
    // var images = await jsonDecode(imagePath) as List;

    // files = images?.map<FileModel>((e) => FileModel.fromJson(e))?.toList();

    if (files.isNotEmpty)
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
        // ignore: deprecated_member_use
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
                            data: widget.data,
                            post: new Post(
                              id: widget.data.posts.length + 1,
                              user: widget.data.config.currentUser,
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CameraScreen(),
                    //   ),
                    // );
                  },
                ),
        ],
      ),
      body: !isLoading
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                    child: image.isNotEmpty
                        ? Image.file(
                            File(image),
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: !isLoading && selectedFile.files != null
                        ? selectedFile.files.length >= 10
                            ? 10
                            : selectedFile.files.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
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
                                    Colors.black
                                        .withOpacity(image == file ? 0.2 : 1),
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
                  ),
                ],
              ))
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 120.0,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Não há fotos neste dispositivo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Use a câmera do ${Palette.name} para tirar uma foto.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        color: Palette.dogaoRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => CameraScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'Abrir câmera',
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
