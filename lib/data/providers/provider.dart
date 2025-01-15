import 'package:backend/data/models/base_models.dart';

abstract class Provider {
  String get id;
  String get name;
  String get baseUrl;
  String get description;
  Future<SearchResultsModel> search(String query);
  Future<DetailedArtistModel> getArtist(String url);
  Future<DetailedAlbumModel> getAlbum(String url);
  Future<DetailedTrackModel> getTrack(String url);
  Future<TagPageModel> getTag(String url);
  Future<TagPageMoreArtistPageModel> getTagArtists(String url, int? page);
  Future<TagPageMoreAlbumPageModel> getTagAlbums(String url, int? page);
  Future<TagPageMoreTrackPageModel> getTagTracks(String url, int? page);
  Future<String> getLyrics(String url);
  Future<List<EventModel>> getEvents(String url);
  Future<SongInfo> extractor(String url);
}
