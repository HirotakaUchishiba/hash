import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  final String? id;
  final String? nickname;
  final String? university;
  final String? faculty;
  final String? email;
  final String? photoUrl;
  final String? bio;
  final DateTime? createdAt;

  Member({
    this.id,
    this.nickname,
    this.university,
    this.faculty,
    this.email,
    this.photoUrl,
    this.bio,
    this.createdAt,
  });

  factory Member.fromJson(dynamic json) {
    return Member(
      id: json["id"],
      nickname: json["nickname"],
      university: json["university"],
      faculty: json["faculty"],
      email: json["email"],
      photoUrl: json["photoUrl"],
      bio: json['bio'],
      createdAt: _toDate(json, 'createdAt'),
    );
  }

  static DateTime _toDate(Map<dynamic, dynamic> data, String fieldName) {
    final Map? createdAtMap = data[fieldName];

    if (createdAtMap == null) {
      return DateTime.now();
    }
    final int second = createdAtMap['_seconds'];
    final timeStamp = Timestamp.fromMillisecondsSinceEpoch(second * 1000);
    final DateTime dTime = timeStamp.toDate();
    return dTime;
  }

}