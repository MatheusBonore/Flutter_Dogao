// import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

// import 'package:flutter/cupertino.dart';

// import 'package:esys_flutter_share/esys_flutter_share.dart';

// import 'package:camera/camera.dart';

// import 'package:path/path.dart';

// import 'package:path_provider/path_provider.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_dogao/data/data.dart';

// import 'package:flutter_dogao/models/models.dart';

// import 'package:flutter_dogao/config/palette.dart';

// import 'package:flutter_dogao/screens/screens.dart';

// import 'package:flutter_dogao/widgtes/widgtes.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;

  const PreviewScreen({
    Key key,
    this.imgPath,
  }) : super(key: key);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // getBytesFromFile().then((bytes) {
                      //   Share.file('Share via', basename(widget.imgPath),
                      //       bytes.buffer.asUint8List(), 'image/path');
                      // });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }
}
