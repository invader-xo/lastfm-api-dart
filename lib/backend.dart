import 'dart:io';

import 'package:alfred/alfred.dart';

import 'data/providers/last_fm/last_fm_provider.dart';

Future<void> start(
    String bindIp, int port, int version, String apiString) async {
  final app = Alfred();
  final apiPath = '$apiString/v$version';
  final provider = LastFMProvider();

  app.get('$apiPath/', (req, res) {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    res.json({'message': 'Welcome to the Muusic backend'});
  });

  app.get('$apiPath/search/:query', (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    try {
      var results = await provider.search(req.params['query']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post('$apiPath/details/artist', (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getArtist(body['url']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/details/album", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getAlbum(body['url']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/details/track", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getTrack(body['url']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/details/tag", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getTag(body['url']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/tag/artists", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getTagArtists(body['url'], body['page']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/tag/albums", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getTagAlbums(body['url'], body['page']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/tag/tracks", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getTagTracks(body['url'], body['page']);
      res.json(results.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/lyrics", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getLyrics(body['url']);
      res.json({'lyrics': results});
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/events", (req, res) async {
    res.headers.contentType = ContentType.json;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return;
    }
    try {
      var results = await provider.getEvents(body['url']);
      res.json(results.map((e) => e.toJson()).toList());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  app.post("$apiPath/extractor", (req, res) async {
    res.headers.contentType = ContentType.binary;
    res.headers.add('Access-Control-Allow-Origin', '*');
    var body = await req.bodyAsJsonMap;
    if (body['url'] == null) {
      res.json({'error': 'No url provided'});
      return null;
    }
    try {
      var data = await provider.extractor(body['url']);
      res.json(data.toJson());
    } catch (e) {
      res.statusCode = 500;
      res.json({'error': e.toString()});
    }
  });

  await app.listen(
    port,
    bindIp,
  );
}
