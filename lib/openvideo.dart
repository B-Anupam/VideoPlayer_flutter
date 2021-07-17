import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

Directory directory = Directory('storage/emulated/0/Download/');

class VideoPlay extends StatefulWidget {
  final String videoFile;
  VideoPlay(this.videoFile);

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  void initState() {
    // initialize();
    super.initState();
  }

  // void initialize() async {
  //   Directory _vd = Directory('${widget.directory.path}/video');
  //   bool exist = await _vd.exists();
  //   if (!exist) await _vd.create();
  //   for (var fileorDir in _vd.listSync()) {
  //     if (fileorDir is File) {
  //       String type = lookupMimeType(fileorDir.path);
  //       if (type != null && (type.contains("video"))) {
  //         files.add(fileorDir);
  //       }
  //     }
  //   }
  //   setState(() {});
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Container(
        child: BetterPlayer.file(
          '${widget.videoFile}',
          betterPlayerConfiguration: BetterPlayerConfiguration(aspectRatio: 1),
        ),
      ),
    );
  }
}
