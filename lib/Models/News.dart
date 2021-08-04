import 'package:recipe/Models/Image.dart';


class News {

  final String body;
  final String head;
  final String id;
  final Image image;
  final String link;
  final String publishDateTime;


	News.fromJsonMap(Map<String, dynamic> map): 
		body = map["body"],
		head = map["head"],
		id = map["id"],
		image = Image.fromJsonMap(map["image"]),
		link = map["link"],
		publishDateTime = map["publishDateTime"];

}
