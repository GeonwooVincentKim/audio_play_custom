import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:music_player/lastfm_api/lastfm.dart';

class ApiService {
  static const String baseUrl = 'http://ws.audioscrobbler.com/2.0/?method=track.search&track=the&api_key=3530d6997e980ac6e9c0ad3cf38b692b&format=json';

  static Future<List<LastFm>> getLastFm() async {
    List<LastFm> listLastFm = [];

    final url = Uri.parse('$baseUrl');
    final urlResponse = await http.get(url);

    if (urlResponse.statusCode == 200) {
      final getSong = jsonDecode(urlResponse.body);
      final results = getSong['results']['trackmatches']['track'];

      for (var result in results) {
        final getSongInfo = LastFm.fromJson(result);
        listLastFm.add(getSongInfo);
      }

      return listLastFm;
    }
    
    throw Error();
  }
}
