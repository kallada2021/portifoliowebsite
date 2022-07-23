import 'dart:convert';

class Services {
  final String id;
  final String type;
  final String description;
  final String imageUrl;
  final List<String> technologies;

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

  Services copyWith({
    String? id,
    String? type,
    String? description,
    String? imageUrl,
    List<String>? technologies,
  }) {
    return Services(
      id: id ?? this.id,
      type: type ?? this.type,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
