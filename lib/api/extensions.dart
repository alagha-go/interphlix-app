import 'dart:convert';

import 'package:http/http.dart' as http;
import '../main.dart';
import '../objects/movie.dart';
import 'movies.dart';

List<int> loadingindexes = [];

getMoviesExtension(String path, int index) async {
  if (loadingindexes.contains(index) || index == 0) {
    return;
  } else {
    loadingindexes.add(index);
  }
  final response = await http.get(
    Uri.parse("${apisdomain + path}"),
    headers: headers,
  );

  try {
    var data = json.decode(response.body);
    List<Movie> movies =
        List<Movie>.from(data.map((model) => Movie.fromJson(model)));
    dataHolder.update((value) {
      value.recommendation.departments[index].movies.addAll(movies);
    });
  } catch (err) {
    print(err);
  }
  loadingindexes.remove(index);
}
