import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interphlix/api/movies.dart';
import 'package:interphlix/objects/category.dart';

import '../main.dart';

List<Category> categories = [];

Future<List<Category>> getCategories() async {
  if (categories.length > 0) {
    return categories;
  }
  final response = await http.get(
    Uri.parse("/${apisdomain}/types"),
    headers: headers
  );
  try {
    var data = json.decode(response.body);
    categories =
        List<Category>.from(data.map((model) => Category.fromJson(model)));
    return categories;
  } catch (err) {}
  return categories;
}
