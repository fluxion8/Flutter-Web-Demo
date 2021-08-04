import 'package:mobx/mobx.dart';
import 'package:recipe/Application.dart';
import 'package:recipe/Models/News.dart';
import 'package:recipe/Repository/NewsRepository.dart';

part 'NewsStore.g.dart';

class NewsStore = NewsStoreBase with _$NewsStore;

abstract class NewsStoreBase with Store {
  late List<News> news;

  @observable
  NetworkState stateNews = NetworkState.initial;

  @action
  getAllNews() async {

    stateNews = NetworkState.waiting;

    // add delay for debug
    await Future.delayed(Duration(seconds: 2));

    NewsRepository().getAllNews().catchError((e) {
      stateNews = NetworkState.error;
    }).then((response) {
      news = List<News>.from(response.data['items'].map((e) => News.fromJsonMap(e)));
      stateNews = NetworkState.done;
    });

  }
}

NewsStore newsStore = NewsStore();
