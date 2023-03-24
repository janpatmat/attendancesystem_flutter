import 'dart:convert';

Students studentsFromJson(String str) => Students.fromJson(json.decode(str));

String studentsToJson(Students data) => json.encode(data.toJson());

class Students {
  Students({
    required this.id,
    required this.name,
    required this.email,
  });

  String id;
  String name;
  String email;

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
