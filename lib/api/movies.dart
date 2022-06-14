import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interphlix/controller/main.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/objects/movie.dart';

var headers = {"Cookie": "token=${token()}"};

List<Movie> homeMovies = [];

var index = 0;

Future<List<Movie>>? getHomeMovies() async {
  if (homeMovies.length > 0) {
    return homeMovies;
  }
  final response = await http.get(
    Uri.parse("${apisdomain}/"),
    headers: headers,
  );
  try {
    var data = json.decode(response.body);
    homeMovies = List<Movie>.from(data.map((model) => Movie.fromJson(model)));
    return homeMovies;
  } catch (err) {}
  return homeMovies;
}

String token() {
  return DB.read("token");
}
