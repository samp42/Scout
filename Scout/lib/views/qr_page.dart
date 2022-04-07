import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  final scoutingSheet;

  const QrPage(this.scoutingSheet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tech Scout"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: QrImage(
              data: scoutingSheet.toJson().toString(),
              version: QrVersions.auto,
              size: 440,
              gapless: false,
              embeddedImage: const AssetImage('assets/T4K_RGB_round[colour]_transparent.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: const Size(80, 80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
