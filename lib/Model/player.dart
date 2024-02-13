// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class player {
  String name;
  String team_name;
  String role;
  String id;
  player({
    required this.name,
    required this.team_name,
    required this.role,
    required this.id,
  });
  

  player copyWith({
    String? name,
    String? team_name,
    String? role,
    String? id,
  }) {
    return player(
      name: name ?? this.name,
      team_name: team_name ?? this.team_name,
      role: role ?? this.role,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'team_name': team_name,
      'role': role,
      'id': id,
    };
  }

  factory player.fromMap(Map<String, dynamic> map) {
    return player(
      name: map['name'] as String,
      team_name: map['team_name'] as String,
      role: map['role'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory player.fromJson(String source) => player.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'player(name: $name, team_name: $team_name, role: $role, id: $id)';
  }

  @override
  bool operator ==(covariant player other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.team_name == team_name &&
      other.role == role &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      team_name.hashCode ^
      role.hashCode ^
      id.hashCode;
  }
}
