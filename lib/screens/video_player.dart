import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video_items.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        VideoItems(
          videoPlayerController:
              VideoPlayerController.asset('assets/videos/sample_video1.mp4'),
          looping: true,
          autoplay: true,
        ),
        VideoItems(
          videoPlayerController:
              VideoPlayerController.asset('assets/videos/sample_video2.mp4'),
          looping: false,
          autoplay: false,
        ),
        // VideoItems(
        //   videoPlayerController: VideoPlayerController.network(
        //       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
        //   looping: false,
        //   autoplay: false,
        // ),
      ],
    );
  }
}
