import 'package:dio/dio.dart';

import '../Application.dart';


class NewsRepository{

  Future<Response<dynamic>> getAllNews(){
    return dioClient.get('title/get-news');
  }



}