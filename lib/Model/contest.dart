// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class contests {
  String contestid;
  String logo1;
  String team_name1;
  String logo2;
  String team_name2;
  String contest_name;
  String status;
  
  contests({
    required this.contestid,
    required this.logo1,
    required this.team_name1,
    required this.logo2,
    required this.team_name2,
    required this.contest_name,
    required this.status,
  });

  contests copyWith({
    String? contestid,
    String? logo1,
    String? team_name1,
    String? logo2,
    String? team_name2,
    String? contest_name,
    String? status,
  }) {
    return contests(
      contestid: contestid ?? this.contestid,
      logo1: logo1 ?? this.logo1,
      team_name1: team_name1 ?? this.team_name1,
      logo2: logo2 ?? this.logo2,
      team_name2: team_name2 ?? this.team_name2,
      contest_name: contest_name ?? this.contest_name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contestid': contestid,
      'logo1': logo1,
      'team_name1': team_name1,
      'logo2': logo2,
      'team_name2': team_name2,
      'contest_name': contest_name,
      'status': status,
    };
  }

  factory contests.fromMap(Map<String, dynamic> map) {
    return contests(
      contestid: map['contestid'] as String,
      logo1: map['logo1'] as String,
      team_name1: map['team_name1'] as String,
      logo2: map['logo2'] as String,
      team_name2: map['team_name2'] as String,
      contest_name: map['contest_name'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory contests.fromJson(String source) =>
      contests.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'contests(contestid: $contestid, logo1: $logo1, team_name1: $team_name1, logo2: $logo2, team_name2: $team_name2, contest_name: $contest_name, status: $status)';
  }

  @override
  bool operator ==(covariant contests other) {
    if (identical(this, other)) return true;
  
    return 
      other.contestid == contestid &&
      other.logo1 == logo1 &&
      other.team_name1 == team_name1 &&
      other.logo2 == logo2 &&
      other.team_name2 == team_name2 &&
      other.contest_name == contest_name &&
      other.status == status;
  }

  @override
  int get hashCode {
    return contestid.hashCode ^
      logo1.hashCode ^
      team_name1.hashCode ^
      logo2.hashCode ^
      team_name2.hashCode ^
      contest_name.hashCode ^
      status.hashCode;
  }
}
