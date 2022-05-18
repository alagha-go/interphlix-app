import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interphlix/api/movieclass.dart';

List<Movie> homeMovies = [];

var index = 0;

Future<List<Movie>>? getHomeMovies() async {
  final response = await http.get(
    Uri.parse("https://s1.interphlix.com/"),
  );
  try {
    var data = json.decode(response.body);
    homeMovies = List<Movie>.from(data.map((model) => Movie.fromJson(model)));
    return homeMovies;
  } catch (err) {
    print(err);
  }
  return homeMovies;
}
