// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:camera/camera.dart';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_dogao/data/data.dart';

// import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/screens/screens.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:flutter_dogao/widgtes/widgtes.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } on CameraException catch (ex) {
      _showCameraException(ex);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget(context) {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Container(
        height: _getHeightCamera(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  'Bem-vindo à câmera do ${Palette.name}!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                'Compartilhe fotos e vídeos, e explore novas formas de se expressar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
            Center(
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () async {
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.location,
                    Permission.storage,
                  ].request();
                  print(statuses[Permission.location]);
                },
                child: Text(
                  'Permitir acesso',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  Widget _cameraControlWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 8.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                child: FloatingActionButton(
                  splashColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // _onCapturePressed(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraToggleRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(
            _getCameraLensIcon(lensDirection),
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: _onSwitchCamera,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No camera available');
      }
    }).catchError(
      (err) {
        print('Error : ${err.code}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: _getHeightCamera(context),
          child: Stack(
            children: [
              _cameraPreviewWidget(context),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 40.0,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120.0,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      _cameraControlWidget(context),
                      _cameraToggleRowWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCameraException(CameraException ex) {
    String errorText = 'Error : ${ex.code}\n Error message : ${ex.description}';
    print(errorText);
  }

  double _getHeightCamera(context) {
    if (cameraController == null || !cameraController.value.isInitialized)
      return MediaQuery.of(context).size.height;

    return cameraController.value.previewSize.height;
  }

  // ignore: unused_element
  void _onCapturePressed(context) async {
    try {
      final String path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      await cameraController.takePicture().then((XFile file) {
        if (mounted) {
          setState(() {
            file = path as XFile;
            cameraController?.dispose();
            cameraController = null;
          });
        }
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            imgPath: path,
          ),
        ),
      );
    } catch (ex) {
      _showCameraException(ex);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }

  IconData _getCameraLensIcon(CameraLensDirection lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return Icons.camera_front_outlined;
      case CameraLensDirection.front:
        return Icons.camera_rear_outlined;
      case CameraLensDirection.external:
        return Icons.camera_alt_outlined;
      default:
        return Icons.device_unknown;
    }
  }
}
