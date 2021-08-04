import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipe/Application.dart';
import 'package:recipe/Models/News.dart';
import 'package:recipe/Store/NewsStore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    newsStore.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(
          builder: (BuildContext context) =>
              newsStore.stateNews == NetworkState.done
                  ? (newsStore.news.length == 0
                      ? listNoItem()
                      : successList(context))
                  : newsStore.stateNews == NetworkState.error
                      ? listError()
                      : newsStore.stateNews == NetworkState.waiting
                          ? listLoading()
                          : Container()),
    );
  }
}

// if newsStore.stateNews == NetworkState.done
Widget successList(BuildContext context) => StaggeredGridView.countBuilder(
    shrinkWrap: true,
    staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
    crossAxisCount: 4,
    itemCount: newsStore.news.length,
    itemBuilder: (BuildContext context, int index) =>
        newsCard(newsStore.news[index]));

// if newsStore.stateNews == NetworkState.error
Widget listError() => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Bir hata oluştu"),
        MaterialButton(
            onPressed: () => newsStore.getAllNews(), child: Text("Tekrar dene"))
      ],
    );

// if newsStore.news list length is 0
Widget listNoItem() => Column(
      children: [
        Text("Sonuç bulunamadı"),
        MaterialButton(
            onPressed: () => newsStore.getAllNews(), child: Text("Tekrar dene"))
      ],
    );

// if newsStore.stateNews == NetworkState.loading
Widget listLoading() => CircularProgressIndicator();

Widget newsCard(News news) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(news.image.url),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.head,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
