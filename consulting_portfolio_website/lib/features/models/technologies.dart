import 'dart:convert';

class Technologies {
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Technologies({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory Technologies.fromMap(Map<String, dynamic> map) {
    return Technologies(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      createdAt: map["created_at"] ?? "",
      updatedAt: map["updated_at"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  Technologies copyWith({
    String? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return Technologies(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
