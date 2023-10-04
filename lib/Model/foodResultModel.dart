// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Recepie {
  int id;
  int userId;
  String title;
  Recepie({
    required this.id,
    required this.userId,
    required this.title,
  });

  Recepie copyWith({
    int? id,
    int? userId,
    String? title,
  }) {
    return Recepie(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
    };
  }

  factory Recepie.fromMap(Map<String, dynamic> map) {
    return Recepie(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recepie.fromJson(String source) =>
      Recepie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Recepie(id: $id, userId: $userId, title: $title)';

  @override
  bool operator ==(covariant Recepie other) {
    if (identical(this, other)) return true;

    return other.id == id && other.userId == userId && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ title.hashCode;
}
