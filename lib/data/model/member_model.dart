// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MemberModel extends Equatable {
   final int id;
  final String phone;
  final String firstName;
  final String lastName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MemberModel({required this.id, required this.phone, required this.firstName, required this.lastName, required this.createdAt, required this.updatedAt});

  @override
  String toString() {
    return 'memberModel(id: $id, phone: $phone, firstName: $firstName, lastName: $lastName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  MemberModel copyWith({
    int? id,
    String? phone,
    String? firstName,
    String? lastName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MemberModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  
  @override
  List<Object?> get props => [id,phone,firstName,lastName,createdAt,updatedAt];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: (map["id"] ?? 0) as int,
      phone: (map["phone"] ?? '') as String,
      firstName: (map["firstName"] ?? '') as String,
      lastName: (map["lastName"] ?? '') as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch((map["createdAt"]??0) as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch((map["updatedAt"]??0) as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) => MemberModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
