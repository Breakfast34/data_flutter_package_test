import 'dart:convert';

class Product {
  String name;
  String imageUrl;
  String desc;
  String price;
  String type;
  String id;
  String departmentId;

  Product({
    required this.name,
    required this.imageUrl,
    required this.desc,
    required this.price,
    required this.type,
    required this.id,
    required this.departmentId,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        imageUrl: json["imageUrl"],
        desc: json["desc"],
        price: json["price"],
        type: json["type"],
        id: json["id"],
        departmentId: json["departmentId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "desc": desc,
        "price": price,
        "type": type,
        "id": id,
        "departmentId": departmentId,
      };
}
