
class Image {

  final int height;
  final String id;
  final String url;
  final int width;

	Image.fromJsonMap(Map<String, dynamic> map): 
		height = map["height"],
		id = map["id"],
		url = map["url"],
		width = map["width"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['height'] = height;
		data['id'] = id;
		data['url'] = url;
		data['width'] = width;
		return data;
	}
}
