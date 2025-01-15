import 'package:backend/data/models/base_models.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

Future<SongInfo> getYTVideoAudioData(String url) async {
  var videoId = url.split("v=")[1];
  var yt = YoutubeExplode();
  var manifest = await yt.videos.streamsClient.getManifest(videoId);
  var streamInfo = manifest.audioOnly.withHighestBitrate();
  return SongInfo(
    streamUrl: streamInfo.url.toString(),
    audioCodec: streamInfo.audioCodec.toString(),
    bitrate: streamInfo.bitrate,
    qualityLabel: streamInfo.qualityLabel,
    fileSize: streamInfo.size,
  );
}
