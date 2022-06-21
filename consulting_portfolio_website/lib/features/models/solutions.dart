import 'dart:convert';

class Solutions {
  final String id;
  final String type;
  final String description;
  final List<String> technologies;

  Solutions(
      {required this.id,
      required this.type,
      required this.description,
      required this.technologies});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "description": description,
      "technologies": technologies,
    };
  }

  factory Solutions.fromMap(Map<String, dynamic> map) {
    return Solutions(
      id: map["id"] ?? "",
      type: map["type"] ?? "",
      description: map["description"] ?? "",
      technologies: map["technologies"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  Solutions copyWith({
    String? id,
    String? type,
    String? description,
    List<String>? technologies,
  }) {
    return Solutions(
      id: id ?? this.id,
      type: type ?? this.type,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
    );
  }
}
