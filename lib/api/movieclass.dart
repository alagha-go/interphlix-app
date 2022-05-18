// To parse this JSON data, do
//
//     final Movie = MovieFromJson(jsonString);

import 'dart:convert';

class Movie {
    Movie({
        this.id,
        this.code,
        this.title,
        this.type,
        this.available,
        this.pageUrl,
        this.imageUrl,
        this.released,
        this.server,
        this.servers,
        this.genre,
        this.seasons,
        this.casts,
        this.duration,
        this.countries,
        this.producers,
        this.description,
    });

    String? id;
    String? code;
    String? title;
    String? type;
    bool? available;
    String? pageUrl;
    String? imageUrl;
    DateTime? released;
    Server? server;
    List<Server>? servers;
    List<String>? genre;
    List<Season>? seasons;
    List<String>? casts;
    int? duration;
    List<String>? countries;
    List<String>? producers;
    String? description;

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"] == null ? null : json["_id"],
        code: json["code"] == null ? null : json["code"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : json["type"],
        available: json["available"] == null ? null : json["available"],
        pageUrl: json["page_url"] == null ? null : json["page_url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        released: json["released"] == null ? null : DateTime.parse(json["released"]),
        server: json["server"] == null ? null : Server.fromJson(json["server"]),
        servers: json["servers"] == null ? null : List<Server>.from(json["servers"].map((x) => Server.fromJson(x))),
        genre: json["genre"] == null ? null : List<String>.from(json["genre"].map((x) => x)),
        seasons: json["seasons"] == null ? null : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        casts: json["casts"] == null ? null : List<String>.from(json["casts"].map((x) => x)),
        duration: json["duration"] == null ? null : json["duration"],
        countries: json["countries"] == null ? null : List<String>.from(json["countries"].map((x) => x)),
        producers: json["producers"] == null ? null : List<String>.from(json["producers"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "code": code == null ? null : code,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "available": available == null ? null : available,
        "page_url": pageUrl == null ? null : pageUrl,
        "image_url": imageUrl == null ? null : imageUrl,
        "released": released == null ? null : released!.toIso8601String(),
        "server": server == null ? null : server!.toJson(),
        "servers": servers == null ? null : List<dynamic>.from(servers!.map((x) => x.toJson())),
        "genre": genre == null ? null : List<dynamic>.from(genre!.map((x) => x)),
        "seasons": seasons == null ? null : List<dynamic>.from(seasons!.map((x) => x.toJson())),
        "casts": casts == null ? null : List<dynamic>.from(casts!.map((x) => x)),
        "duration": duration == null ? null : duration,
        "countries": countries == null ? null : List<dynamic>.from(countries!.map((x) => x)),
        "producers": producers == null ? null : List<dynamic>.from(producers!.map((x) => x)),
        "description": description == null ? null : description,
    };
}

class Season {
    Season({
        this.id,
        this.name,
        this.code,
        this.episodes,
    });

    String? id;
    String? name;
    String? code;
    List<Episode>? episodes;

    factory Season.fromRawJson(String str) => Season.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        episodes: json["episodes"] == null ? null : List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "episodes": episodes == null ? null : List<dynamic>.from(episodes!.map((x) => x.toJson())),
    };
}

class Episode {
    Episode({
        this.id,
        this.name,
        this.index,
        this.code,
        this.server,
        this.servers,
    });

    String? id;
    String? name;
    int? index;
    String? code;
    Server? server;
    List<Server>? servers;

    factory Episode.fromRawJson(String str) => Episode.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        index: json["index"] == null ? null : json["index"],
        code: json["code"] == null ? null : json["code"],
        server: json["server"] == null ? null : Server.fromJson(json["server"]),
        servers: json["servers"] == null ? null : List<Server>.from(json["servers"].map((x) => Server.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "index": index == null ? null : index,
        "code": code == null ? null : code,
        "server": server == null ? null : server!.toJson(),
        "servers": servers == null ? null : List<dynamic>.from(servers!.map((x) => x.toJson())),
    };
}

class Server {
    Server({
        this.id,
        this.name,
        this.serverId,
        this.watchId,
        this.url,
    });

    String? id;
    String? name;
    String? serverId;
    String? watchId;
    String? url;

    factory Server.fromRawJson(String str) => Server.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Server.fromJson(Map<String, dynamic> json) => Server(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        serverId: json["id"] == null ? null : json["id"],
        watchId: json["watch_id"] == null ? null : json["watch_id"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "id": serverId == null ? null : serverId,
        "watch_id": watchId == null ? null : watchId,
        "url": url == null ? null : url,
    };
}