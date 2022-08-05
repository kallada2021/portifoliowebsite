import 'dart:convert';

class MeetTheTeam {
  final String? id;
  final String name;
  final String description;

  MeetTheTeam({
    this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
    };
  }

  factory MeetTheTeam.fromMap(Map<String, dynamic> map) {
    return MeetTheTeam(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      description: map["description"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetTheTeam.fromJson(String source) =>
      MeetTheTeam.fromMap(json.decode(source));

  MeetTheTeam copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return MeetTheTeam(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
