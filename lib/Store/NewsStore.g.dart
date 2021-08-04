// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on NewsStoreBase, Store {
  final _$stateNewsAtom = Atom(name: 'NewsStoreBase.stateNews');

  @override
  NetworkState get stateNews {
    _$stateNewsAtom.reportRead();
    return super.stateNews;
  }

  @override
  set stateNews(NetworkState value) {
    _$stateNewsAtom.reportWrite(value, super.stateNews, () {
      super.stateNews = value;
    });
  }

  final _$getAllNewsAsyncAction = AsyncAction('NewsStoreBase.getAllNews');

  @override
  Future getAllNews() {
    return _$getAllNewsAsyncAction.run(() => super.getAllNews());
  }

  @override
  String toString() {
    return '''
stateNews: ${stateNews}
    ''';
  }
}
