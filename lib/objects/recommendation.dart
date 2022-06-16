import 'dart:convert';

import 'package:interphlix/objects/movie.dart';

class Recommendation {
  Recommendation({
    this.seed,
    this.departments,
  });
  double? seed;
  List<Department>? departments;


  factory Recommendation.fromRawJson(String str) =>
      Recommendation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        seed: json["seed"] == null ? null : json["seed"].toDouble(),
        departments: json["categories"] == null
            ? null
            : List<Department>.from(
                json["categories"].map((x) => Department.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seed": seed == null ? null : seed,
        "categories": departments == null
            ? null
            : List<dynamic>.from(departments!.map((x) => x.toJson())),
      };
}

class Department {
  Department({
    this.title,
    this.movies,
  });

  String? title;
  List<Movie>? movies;

  factory Department.fromRawJson(String str) =>
      Department.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        title: json["title"] == null ? null : json["title"],
        movies: json["movies"] == null
            ? []
            : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "movies": movies == null
            ? []
            : List<dynamic>.from(movies!.map((x) => x.toJson())),
      };
}
