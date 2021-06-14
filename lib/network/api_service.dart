import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test_application_bloc/repo/image_repo.dart';

class ImagesService implements ImagesRepo {
  //
  String _baseUrlForList =
      'https://shibe.online/api/shibes?count=5&url=tru&hhtpsUrls=true';
  String _baseUrlForGrid =
      'https://shibe.online/api/shibes?count=20&url=tru&hhtpsUrls=true';

  @override
  Future<List> getImagesList() async {
    Response response = await http.get(Uri.parse(_baseUrlForList));
    List images = json.decode(response.body);

    return images;
  }

  @override
  Future<List> getImagesGridList() async {
    Response response = await http.get(Uri.parse(_baseUrlForGrid));
    List images = json.decode(response.body);
    return images;
  }
}
