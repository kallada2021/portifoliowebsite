import 'dart:convert';
import 'package:flutter/material.dart';

class Services with ChangeNotifier {
  int? id;
  String? type;
  String? description;
  String? imageUrl;
  List<dynamic>? technologies;

  Services(
      {required this.id,
      required this.type,
      required this.description,
      required this.imageUrl,
      required this.technologies});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "description": description,
      "technologies": technologies,
      "image_url": imageUrl,
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      id: map["id"] ?? "",
      type: map["type"] ?? "",
      description: map["description"] ?? "",
      technologies: map["technologies"] ?? "",
      imageUrl: map["image_url"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  Services.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    description = json["description"];
    technologies = json["technologies"];
    imageUrl = json["imageUrl"];
  }
  Services copyWith({
    int? id,
    String? type,
    String? description,
    String? imageUrl,
    List<dynamic>? technologies,
  }) {
    return Services(
      id: id ?? this.id,
      type: type ?? this.type,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  static List<Services> servicesFromJSON(List servicesList) {
    print("snapshot ${servicesList}");
    return servicesList.map((data) {
      return Services.fromJson(data);
    }).toList();
  }
}
