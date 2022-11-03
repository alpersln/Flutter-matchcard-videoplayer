import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerSample extends StatefulWidget {
  const VideoPlayerSample({Key? key}) : super(key: key);

  @override
  State<VideoPlayerSample> createState() => _VideoPlayerSampleState();
}

class _VideoPlayerSampleState extends State<VideoPlayerSample> {
  late VideoPlayerController _controller;

  void _playVideo() {
    setState(() {
      _controller =
          VideoPlayerController.asset('assets/videos/sample_video2.mp4')
            ..initialize().then((_) {
              _controller.pause();
              setState(() {});
            });
    });
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video")),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 500, width: 350, child: VideoPlayer(_controller)),
              _controller.value.isPlaying
                  ? Center(
                      child: SizedBox(
                        height: 420,
                        width: 350,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _controller.pause();
                              _controller.seekTo(Duration(seconds: 0));

                              _controller.setPlaybackSpeed(1);
                            });
                          },
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            //opacity
                            color: Colors.grey.withOpacity(0.4),

                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: () {
                              _controller.play();
                              _controller.setPlaybackSpeed(0.5);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.speed,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        //               play button
                        SizedBox(width: 32),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            //opacity
                            color: Colors.grey.withOpacity(0.4),

                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            //on tap

                            onTap: () {
                              _controller.play();

                              setState(() {});
                            },
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),

          //                      display duration
          // Row(
          //   children: [
          //     ValueListenableBuilder(
          //         valueListenable: _controller,
          //         builder: (context, VideoPlayerValue value, child) {
          //           return Text(
          //             _videoDuration(value.position),
          //             style: TextStyle(fontSize: 20),
          //           );
          //         }),
          //     Expanded(
          //         child: SizedBox(
          //       height: 20,
          //       child: VideoProgressIndicator(
          //         _controller,
          //         allowScrubbing: true,
          //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          //       ),
          //     )),
          //     Text(
          //       _videoDuration(_controller.value.duration),
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
