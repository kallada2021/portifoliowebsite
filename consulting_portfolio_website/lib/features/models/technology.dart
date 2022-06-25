import 'dart:convert';

class Technology {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Technology({
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

  factory Technology.fromMap(Map<String, dynamic> map) {
    return Technology(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      createdAt: map["created_at"] ?? "",
      updatedAt: map["updated_at"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Technology.fromJson(String source) => Technology.fromMap(
        json.decode(source),
      );

  Technology copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return Technology(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
