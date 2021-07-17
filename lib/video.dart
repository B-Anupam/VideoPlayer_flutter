import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mediashare/openvideo.dart';
import 'package:thumbnails/thumbnails.dart';

final Directory _videoDir = Directory('storage/emulated/0/Download');

class VideoListView extends StatefulWidget {
  @override
  VideoListViewState createState() {
    return new VideoListViewState();
  }
}

class VideoListViewState extends State<VideoListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!Directory("${_videoDir.path}").existsSync()) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Video Check"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text(
              "No Videos",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Videos"),
        ),
        body: VideoGrid(directory: _videoDir),
      );
    }
  }
}

class VideoGrid extends StatefulWidget {
  final Directory directory;

  const VideoGrid({Key key, this.directory}) : super(key: key);

  @override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {
  _getImage(videoPathUrl) async {
    //await Future.delayed(Duration(milliseconds: 500));
    String thumb = await Thumbnails.getThumbnail(
        videoFile: videoPathUrl,
        imageType:
            ThumbFormat.PNG, //this image will store in created folderpath
        quality: 10);
    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    var videoList = widget.directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".mp4"))
        .toList(growable: false);

    if (videoList != null) {
      if (videoList.length > 0) {
        return Container(
          padding: EdgeInsets.only(bottom: 40.0),
          child: GridView.builder(
            itemCount: videoList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => VideoPlay(videoList[index])),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: FutureBuilder(
                        future: _getImage(videoList[index]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Column(children: <Widget>[
                                Hero(
                                  tag: videoList[index],
                                  child: Image.file(
                                    File(snapshot.data),
                                    height: 280.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: RaisedButton(
                                    child: Text("Play Video"),
                                    color: Colors.indigo,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlay(videoList[index])),
                                      );
                                    },
                                  ),
                                ),
                              ]);
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          } else {
                            return Hero(
                              tag: videoList[index],
                              child: Container(
                                  height: 280.0,
                                  child: Text("Please Try Again")),
                            );
                          }
                        }),
                    //new cod
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text(
              "Sorry, No Videos Found.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
//
//2
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
