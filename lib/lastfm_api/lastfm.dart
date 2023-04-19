import 'package:flutter/material.dart';

class LastFm {
  final String name;
  final String artist;
  final String url;

  LastFm({
    required this.name,
    required this.artist,
    required this.url
  });

  factory LastFm.fromJson(Map<String, dynamic> json) {
    return LastFm(
      name: json['name'] as String,
      artist: json['artist'] as String,
      url: json['url'] as String
    );
  }
}
