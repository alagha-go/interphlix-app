import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:interphlix/objects/movie.dart';

class Recommendation {
  Recommendation({
    this.seed,
    this.departments,
  }) : scrollController = ScrollController();
  double? seed;
  List<Department>? departments;
  ScrollController? scrollController;

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
  String? title;
  String? path;
  List<Movie>? movies;
  ScrollController? scrollController;

  Department({this.title, this.path, this.movies}) : scrollController = ScrollController(debugLabel: title);

  factory Department.fromRawJson(String str) =>
      Department.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        title: json["title"] == null ? "" : json["title"],
        path: json["path"] == null ? "" : json["path"],
        movies: json["movies"] == null
            ? []
            : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? "" : title,
        "path": path == null ? "": path,
        "movies": movies == null
            ? []
            : List<dynamic>.from(movies!.map((x) => x.toJson())),
      };
}
