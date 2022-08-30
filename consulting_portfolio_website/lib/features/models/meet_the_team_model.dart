import 'dart:convert';

import 'package:equatable/equatable.dart';

class MeetTheTeam with EquatableMixin {
  final int? id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  MeetTheTeam({
    this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }

  factory MeetTheTeam.fromMap(Map<String, dynamic> map) {
    return MeetTheTeam(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      createdAt: map["created_at"] ?? "",
      updatedAt: map["updated_at"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetTheTeam.fromJson(String source) =>
      MeetTheTeam.fromMap(json.decode(source));

  MeetTheTeam copyWith({
    int? id,
    String? name,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return MeetTheTeam(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, description, createdAt, updatedAt];
}
