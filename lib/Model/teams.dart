// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class teammodel {
  String logo;
  String id;
  String name;
  teammodel({
    required this.logo,
    required this.id,
    required this.name,
  });
 



  teammodel copyWith({
    String? logo,
    String? id,
    String? name,
  }) {
    return teammodel(
      logo: logo ?? this.logo,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo': logo,
      'id': id,
      'name': name,
    };
  }

  factory teammodel.fromMap(Map<String, dynamic> map) {
    return teammodel(
      logo: map['logo'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory teammodel.fromJson(String source) => teammodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'teammode(logo: $logo, id: $id, name: $name)';

  @override
  bool operator ==(covariant teammodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.logo == logo &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => logo.hashCode ^ id.hashCode ^ name.hashCode;
}
