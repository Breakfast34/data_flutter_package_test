import 'dart:convert';

class Department {
  String name;
  String imageUrl;
  String id;

  Department({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  factory Department.fromRawJson(String str) =>
      Department.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        name: json["name"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "id": id,
      };
}
