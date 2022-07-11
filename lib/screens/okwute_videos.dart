
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../widgets/okwute_video_item.dart';

class InOkwutesWordVidoes extends StatefulWidget {
  const InOkwutesWordVidoes({Key? key}) : super(key: key);

  @override
  _InOkwutesWordVidoesState createState() => _InOkwutesWordVidoesState();
}

class _InOkwutesWordVidoesState extends State<InOkwutesWordVidoes> {
  final videos = POAppConstants.POVideos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (BuildContext context, int index) {
              final video = videos[index];
              return OkwuteVidoeItem(
                isFullscreen: true,
                autoplay: true,
                videoId: video,
              );
            }));
  }
}