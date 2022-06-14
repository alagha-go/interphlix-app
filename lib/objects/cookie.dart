import 'dart:convert';

class Cookie {
  Cookie({
    this.name,
    this.value,
    this.path,
    this.domain,
    this.expires,
    this.rawExpires,
    this.maxAge,
    this.secure,
    this.httpOnly,
    this.sameSite,
    this.raw,
    this.unparsed,
  });

  String? name;
  String? value;
  String? path;
  String? domain;
  DateTime? expires;
  String? rawExpires;
  int? maxAge;
  bool? secure;
  bool? httpOnly;
  int? sameSite;
  String? raw;
  dynamic unparsed;

  factory Cookie.fromRawJson(String str) => Cookie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cookie.fromJson(Map<String, dynamic> json) => Cookie(
        name: json["Name"] == null ? null : json["Name"],
        value: json["Value"] == null ? null : json["Value"],
        path: json["Path"] == null ? null : json["Path"],
        domain: json["Domain"] == null ? null : json["Domain"],
        expires:
            json["Expires"] = DateTime.parse(json["Expires"]),
        rawExpires: json["RawExpires"] == null ? null : json["RawExpires"],
        maxAge: json["MaxAge"] == null ? null : json["MaxAge"],
        secure: json["Secure"] == null ? null : json["Secure"],
        httpOnly: json["HttpOnly"] == null ? null : json["HttpOnly"],
        sameSite: json["SameSite"] == null ? null : json["SameSite"],
        raw: json["Raw"] == null ? null : json["Raw"],
        unparsed: json["Unparsed"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Value": value == null ? null : value,
        "Path": path == null ? null : path,
        "Domain": domain == null ? null : domain,
        "Expires": expires == null ? null : expires!.toIso8601String(),
        "RawExpires": rawExpires == null ? null : rawExpires,
        "MaxAge": maxAge == null ? null : maxAge,
        "Secure": secure == null ? null : secure,
        "HttpOnly": httpOnly == null ? null : httpOnly,
        "SameSite": sameSite == null ? null : sameSite,
        "Raw": raw == null ? null : raw,
        "Unparsed": unparsed,
      };
}
