import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlays extends StatefulWidget {
  const YoutubePlays({super.key});

  @override
  State<YoutubePlays> createState() => _YoutubePlaysState();
}

class _YoutubePlaysState extends State<YoutubePlays> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    String? videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=3gU1OLKBcys");
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          enableCaption: false,
          isLive: false,
          controlsVisibleAtStart: true,
          forceHD: true,
        ),
      );
    } else {

    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.portrait
        ? Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              _controller.addListener(() {});
            },
          ),
        ),
      ],
    )
        : YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        _controller.addListener(() {});
      },
      // You can manage full screen in landscape mode here
    );
  }
}
