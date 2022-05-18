import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interphlix/objects/category.dart';

List<Category> categories = [];

Future<List<Category>> getCategories() async {
  if (categories.length > 0) {
    return categories;
  }
  final response = await http.get(
    Uri.parse("https://s1.interphlix.com/types"),
  );
  try {
    var data = json.decode(response.body);
    categories =
        List<Category>.from(data.map((model) => Category.fromJson(model)));
    return categories;
  } catch (err) {}
  return categories;
}
