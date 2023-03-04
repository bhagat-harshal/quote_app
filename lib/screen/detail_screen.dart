import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quote_app/common/custom_font.dart';
import 'package:quote_app/controller/quote_detail_controller.dart';

import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _globalKey = GlobalKey();
  int _index = 0;

  final QuoteDetailController quoteDetailController =
      Get.put(QuoteDetailController());

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String filePath = routes["category"];

    quoteDetailController.loadQuotes(filePath);

    return Scaffold(
      body: GetX<QuoteDetailController>(builder: (controller) {
        if (kDebugMode) {
          print("quote count -> ${controller.quotes.length}");
        }
        return Stack(
          children: [
            RepaintBoundary(
              key: _globalKey,
              child: PageView.builder(
                  itemCount: controller.quotes.length,
                  itemBuilder: (context, index) {
                    _index = index;
                    return SafeArea(
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.1),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.9)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                            padding: const EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.quotes[index].message,
                                  style: const TextStyle(fontSize: 35),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )));
                  }),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: [
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: IconButton(
                        onPressed: _share,
                        icon: const Icon(
                          CustomFont.share,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          CustomFont.heartEmpty,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: IconButton(
                        onPressed: _download,
                        icon: const Icon(
                          CustomFont.download,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }

  void _share() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      Directory applicationDirectory = await getTemporaryDirectory();
      File tmp = File(path.join(applicationDirectory.path,
          DateTime.now().millisecondsSinceEpoch.toString()));
      await tmp.writeAsBytes(pngBytes);

      List<XFile> files = <XFile>[];
      files.add(XFile(tmp.path));
      await Share.shareXFiles(files, text: 'Image Shared');
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _download() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      Directory applicationDirectory = await getTemporaryDirectory();
      File tmp = File(path.join(applicationDirectory.path,
          DateTime.now().millisecondsSinceEpoch.toString()));
      await tmp.writeAsBytes(pngBytes);

      var d0 = await getApplicationDocumentsDirectory();
      var d1 = await getApplicationSupportDirectory();
      var d2 = await getExternalStorageDirectories();
      var d3 = await getDownloadsDirectory();

      // List<XFile> files = <XFile>[];
      // files.add(XFile(tmp.path));
      // await Share.shareXFiles(files, text: 'Image Shared');

      Get.snackbar("Download", "message", snackPosition: SnackPosition.BOTTOM);
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
