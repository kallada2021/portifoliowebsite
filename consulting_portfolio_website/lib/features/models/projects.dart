import 'dart:convert';

class Projects {
  final String id;
  final String name;
  final String description;
  final List<String> technologies;
  final String createdAt;
  final String updatedAt;

  Projects({
    required this.id,
    required this.name,
    required this.description,
    required this.technologies,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "technologies": technologies,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory Projects.fromMap(Map<String, dynamic> map) {
    return Projects(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      technologies: map["technologies"] ?? "",
      createdAt: map["created_at"] ?? "",
      updatedAt: map["updated_at"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Projects.fromJson(String source) =>
      Projects.fromMap(json.decode(source));

  Projects copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? technologies,
    String? createdAt,
    String? updatedAt,
  }) {
    return Projects(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
