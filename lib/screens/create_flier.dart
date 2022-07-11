import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CreateIsupportFlier extends StatefulWidget {
  const CreateIsupportFlier({Key? key}) : super(key: key);

  @override
  _CreateIsupportFlierState createState() => _CreateIsupportFlierState();
}

class _CreateIsupportFlierState extends State<CreateIsupportFlier> {
  File? _image;
  final _picker = ImagePicker();
  bool showViews = false;
  Uint8List? _snapshotImage;
  ScreenshotController screenshotController = ScreenshotController();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> takeSnapShot() async {
    screenshotController
        .capture(delay: const Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((Uint8List? image) async {
      //Capture Done
      setState(() {
        _snapshotImage = image!;
      });

      final directory = (await getApplicationDocumentsDirectory()).path;
      final fileName = DateTime.now().millisecond.toString() + '-po.png';
      File file = File('$directory/$fileName');
      file.writeAsBytes(_snapshotImage!);
      await Share.shareFiles(['$directory/$fileName'],
          text:
              '#2023 Election, I support Peter Obi & Yusuf Datti Baba Ahmed via Labor party. \n Join me, create a #Isupport flyer with PGO App, download app => https://cutt.ly/PeterObiApp  \n Follow https://twitter.com/_phils on twitter for App update  ');

      debugPrint(fileName);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create #ISupport flyer"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _image != null
            ? FloatingActionButton(
                tooltip: "Tap to share",
                backgroundColor: Colors.red,
                onPressed: () async {
                  takeSnapShot();
                },
                child: const Icon(Icons.camera_front_outlined),
              )
            : const SizedBox.shrink(),
        body: SizedBox(
          height: size.height * .7,
          child: Screenshot(
            controller: screenshotController,
            child: Card(
                margin: const EdgeInsets.all(8),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Positioned(
                          top: -70,
                          right: -60,
                          child: Visibility(
                            visible: _image != null,
                            child: const CircleAvatar(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal,
                              radius: (85),
                              child: CircleAvatar(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 26.0, top: 29),
                                    child: Text(
                                      "#OBI-DATTI \n2023",
                                      style: TextStyle(
                                          fontFamily: 'nexa',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12),
                                    ),
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.orange,
                                  radius: (70)),
                            ),
                          )),
                      Positioned(
                          child: Visibility(
                        visible: _image != null,
                        child: Image.asset(
                          "assets/lb.png",
                          width: 60,
                        ),
                      )),
                      Positioned(
                          bottom: 55,
                          right: 0,
                          child: Visibility(
                            visible: _image != null,
                            child: Image.asset(
                              "assets/lb.png",
                              width: 60,
                            ),
                          )),
                      Positioned(
                        bottom: 55,
                        child: Visibility(
                          visible: _image != null,
                          child: Container(
                            width: size.width / 3,
                            height: 40,
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Text(
                                "BREAKING",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'nexa'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Visibility(
                          visible: _image != null,
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 8),
                              child: Text(
                                "2023 ELECTION - GO GET YOUR PVC #NOW 4 #OBIDATTI",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'nexa',
                                    fontSize: 12),
                              ),
                            ),
                            width: size.width,
                            height: 55,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Visibility(
                          visible: _image != null,
                          child: const Text("I SUPPORT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 35,
                                  fontFamily: "nexa")),
                        ),
                        top: 0,
                        left: 90,
                      ),
                      Positioned(
                        child: Visibility(
                          visible: _image != null,
                          child: const Text("Peter Obi",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40,
                                  fontFamily: "nexa")),
                        ),
                        top: 35,
                        left: 80,
                      ),
                      Positioned(
                        child: Visibility(
                          visible: _image != null,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Federal republic of Nigeria ",
                              style: TextStyle(
                                  fontFamily: "nexa",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.teal),
                            ),
                          ),
                        ),
                        top: 110,
                        left: 25,
                      ),
                      Positioned(
                        child: Visibility(
                          visible: _image != null,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "FOR PRESIDENT",
                              style: TextStyle(
                                  fontFamily: "nexa",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        top: 75,
                        left: 90,
                      ),
                      InkWell(
                        onTap: _openImagePicker,
                        child: Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                foregroundColor: Colors.redAccent,
                                // backgroundColor: Colors.teal,
                                radius: size.width * .23,
                                child: CircleAvatar(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.teal,
                                  radius: (size.width * .20),
                                  child: _image != null
                                      ? ClipOval(
                                          child: Image.file(
                                            _image!,
                                            fit: BoxFit.cover,
                                            width: size.width * .38,
                                            height: size.width * .38,
                                          ),
                                        )
                                      : const Text(
                                          "Tap to pick photo \n - Selfie preferred -",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Visibility(
                                    visible: _image != null,
                                    child: CircleAvatar(
                                      foregroundColor: Colors.teal,
                                      backgroundColor: Colors.redAccent,
                                      radius: (size.width * .094),
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/po.png",
                                          fit: BoxFit.cover,
                                          width: size.width * .16,
                                          height: size.width * .16,
                                        ),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Visibility(
                                    visible: _image != null,
                                    child: CircleAvatar(
                                      foregroundColor: Colors.teal,
                                      backgroundColor: Colors.green,
                                      radius: (size.width * .085),
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/datti.png",
                                          fit: BoxFit.cover,
                                          width: size.width * .15,
                                          height: size.width * .15,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
