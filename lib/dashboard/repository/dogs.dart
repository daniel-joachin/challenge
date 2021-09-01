import 'dart:convert';

import 'package:app/dashboard/models/allBreeds.dart';
import 'package:http/http.dart' as http;

class Dogs {
  static getBreeds() async {
    http.Response response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode != 200) {
      Exception(response.statusCode);
    }

    Map<String, dynamic> breedsJson = jsonDecode(response.body)["message"];
    AllBreeds.fromJson(breedsJson);
  }

  static Future<String> getImage(
      {required String subBreed, required String breed}) async {
    http.Response response = await http.get(
        Uri.parse('https://dog.ceo/api/breed/$breed/$subBreed/images/random'));
    if (response.statusCode != 200) {
      Exception(response.statusCode);
    }

    String url = jsonDecode(response.body)["message"];
    return url;
  }
}
