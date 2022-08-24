import 'dart:convert';

import 'package:api_test/models/data.dart';
import 'package:http/http.dart' as http;

class FitchData {
  Future<Post> apicall() async {
    // var client = http.Client();

    final response = await http.get(
      Uri.parse(
          'https://api.unsplash.com/search/photos?per_page=40&query=erbil&client_id=jys7uENafEvKSItn2upbUG9XL0OghqoEDTGSfRW0fvo'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Post.fromJson(data);
    } else {
      return Post.fromJson(data);
    }
  }
}
