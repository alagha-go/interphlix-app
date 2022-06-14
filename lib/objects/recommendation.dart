import 'dart:convert';

import 'package:interphlix/objects/movie.dart';

class Recommendation {
  Recommendation({
    this.seed,
    this.categories,
  });
  double? seed;
  List<Category>? categories;


  factory Recommendation.fromRawJson(String str) =>
      Recommendation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        seed: json["seed"] == null ? null : json["seed"].toDouble(),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seed": seed == null ? null : seed,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.title,
    this.movies,
  });

  String? title;
  List<Movie>? movies;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"] == null ? null : json["title"],
        movies: json["movies"] == null
            ? null
            : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "movies": movies == null
            ? null
            : List<dynamic>.from(movies!.map((x) => x.toJson())),
      };
}
