
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OkwuteVidoeItem extends StatefulWidget {
  final bool isFullscreen;
  final bool autoplay;
  final String videoId;

  const OkwuteVidoeItem(
      {Key? key,
        required this.isFullscreen,
        required this.autoplay,
        required this.videoId})
      : super(key: key);

  @override
  _OkwuteVidoeItemState createState() => _OkwuteVidoeItemState();
}

class _OkwuteVidoeItemState extends State<OkwuteVidoeItem> {
  YoutubePlayerController? _ytbPlayerController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: widget.videoId,
          params: YoutubePlayerParams(
            showFullscreenButton: widget.isFullscreen,
            autoPlay: widget.autoplay,
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: _ytbPlayerController != null
            ? YoutubePlayerIFrame(controller: _ytbPlayerController)
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}