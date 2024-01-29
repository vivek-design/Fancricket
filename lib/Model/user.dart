// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String password;
  String token;
  String type;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.token,
    required this.type,
    required this.phone,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? token,
    String? type,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      type: type ?? this.type,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': token,
      'type': type,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
      type: map['type'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, token: $token, type: $type, phone: $phone)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.token == token &&
      other.type == type &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      token.hashCode ^
      type.hashCode ^
      phone.hashCode;
  }
}
