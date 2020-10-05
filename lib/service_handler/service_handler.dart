import 'dart:convert';
import 'package:bloc_pattern/model/gallery_images.dart';
import 'package:http/http.dart' show Client;

class ServiceHandler {
  Client client = Client();
  final _baseUrl = "https://jsonplaceholder.typicode.com/photos";

  Future<List<GalleryImages>> fetchData() async {
    final response = await client.get("$_baseUrl");
    final jsonresponse = json.decode(response.body);

    if (response.statusCode == 200) {
      return jsonresponse
          .map<GalleryImages>((x) => GalleryImages.fromjson(x))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
