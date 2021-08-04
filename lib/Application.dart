import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigator = GlobalKey();

Dio dioClient = Dio(BaseOptions(
    baseUrl:
        'https://imdb8.p.rapidapi.com/',
    queryParameters: {'tconst':'tt0944947','limit':25},
    headers: {
      'x-rapidapi-key': 'c6e3eadda0msh3f7b05bcd555df2p14692bjsnb2ca0ea7846c',
      'x-rapidapi-host': 'imdb8.p.rapidapi.com'
    }));

push(Widget page) {
  navigator.currentState!.push(MaterialPageRoute(builder: (context) => page));
}

enum NetworkState { initial, done, waiting, error }
