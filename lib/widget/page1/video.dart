import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}

class BackgroundVideoState extends State<BackgroundVideo> {

  VideoPlayerController _controller;
  
  @override
  void initState(){
    super.initState();

    _controller = VideoPlayerController.asset("assets/video/bg.mp4")
      ..initialize().then((value) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        setState(() {}); 
      });
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          );
  }
}