import 'dart:convert';

class Contact {
  final String id;
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final String message;

  Contact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.emailAddress,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "phoneNumber": phoneNumber,
      "email": emailAddress,
      "message": message,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      phoneNumber: map["phoneNumber"] ?? "",
      emailAddress: map["email"] ?? "",
      message: map["message"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  Contact copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? emailAddress,
    String? message,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      message: message ?? this.message,
    );
  }
}
