

import 'Role.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  DateTime? emailVerifiedAt;
  int? roleId;
  String? token;
  DateTime? createdAt;
  DateTime? updatedAt;
  Role? role;

  User({
    this.id,
    this.name,
    this.email,
    this.token,
    this.emailVerifiedAt,
    this.image,
    this.roleId,
    this.createdAt,
    this.updatedAt,
    this.role
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['user']['id'];
    name = json['user']['name'];
    email = json['user']['email'];
    image = json['user']['image'] ?? '';
    emailVerifiedAt =
        DateTime.tryParse(json['user']['email_verified_at'] ?? '');
    roleId = json['user']['roleId'];
    token = json['token'];
    createdAt = DateTime.tryParse(json['user']['created_at']);
    updatedAt = DateTime.tryParse(json['user']['updated_at']);
    // role = json['user']['role'] != null ? Role.fromJson(json['user']['role']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['email_verified_at'] = emailVerifiedAt;
    data['role_id'] = roleId;
    data['token'] = token;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // if (role != null) {
    // data['role'] = role! toJson();
    // }
    return data;
  }
  User.fromJson2 (Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'] ?? '';
    emailVerifiedAt = DateTime.tryParse(json['email_verified_at'] ?? '');
    roleId = json['role_id'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
    // role = json['role'] = null Role.fromJson(json['role']): null;
  }
}