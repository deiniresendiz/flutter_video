import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWebPage extends StatefulWidget {
  VideoWebPage({Key key}) : super(key: key);

  @override
  _VideoWebPageState createState() => _VideoWebPageState();
}

class _VideoWebPageState extends State<VideoWebPage> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Video Simple"),
      ),
      body: Center(
          child: _videoPlayerController.value.initialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _videoPlayerController.value.isPlaying
                  ? _videoPlayerController.pause()
                  : _videoPlayerController.play();
            });
          },
          child: Icon(
            _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }
}