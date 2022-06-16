import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interphlix/api/movies.dart';
import 'package:interphlix/objects/category.dart';

import '../main.dart';

getCategories() async {
  if (dataHolder.value.categories != null) {
    return "";
  }
  String url = "${apisdomain}/types";
  final response = await http.get(Uri.parse(url), headers: headers);
  try {
    var data = json.decode(response.body);
    dataHolder.update((value) {
      value.categories =
          List<Category>.from(data.map((model) => Category.fromJson(model)));
    });
    return "";
  } catch (err) {
    print(err);
  }
  return "";
}
