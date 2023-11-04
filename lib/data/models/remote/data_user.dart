import 'dart:convert';

class RemoteDataUsers {
  List<Result> results;

  RemoteDataUsers({
    required this.results,
  });

  factory RemoteDataUsers.fromRawJson(String str) =>
      RemoteDataUsers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RemoteDataUsers.fromJson(Map<String, dynamic> json) =>
      RemoteDataUsers(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String gender;
  Name name;
  String email;
  Registered registered;
  String phone;
  Picture picture;

  Result({
    required this.gender,
    required this.name,
    required this.email,
    required this.registered,
    required this.phone,
    required this.picture,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        email: json["email"],
        registered: Registered.fromJson(json["registered"]),
        phone: json["phone"],
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "email": email,
        "registered": registered.toJson(),
        "phone": phone,
        "picture": picture.toJson(),
      };
}

class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromRawJson(String str) => Picture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}

class Registered {
  int age;

  Registered({
    required this.age,
  });

  factory Registered.fromRawJson(String str) =>
      Registered.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Registered.fromJson(Map<String, dynamic> json) => Registered(
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
      };
}
