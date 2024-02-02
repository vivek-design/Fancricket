// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

class player {
  String id;
  String name;
  player({
    required this.id,
    required this.name,
  });

  player copyWith({
    String? id,
    String? name,
  }) {
    return player(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory player.fromMap(Map<String, dynamic> map) {
    return player(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory player.fromJson(String source) =>
      player.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'player(id: $id, name: $name)';

  @override
  bool operator ==(covariant player other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}



class runningcontest {
  String contest_name;
  String status;
  String team1_name;
  String team2_name;
  String team1_logo;
  String team2_logo;
  List<player> team1_player;
  List<player> teamp2_player;
  runningcontest({
    required this.contest_name,
    required this.status,
    required this.team1_name,
    required this.team2_name,
    required this.team1_logo,
    required this.team2_logo,
    required this.team1_player,
    required this.teamp2_player,
  });

  runningcontest copyWith({
    String? contest_name,
    String? status,
    String? team1_name,
    String? team2_name,
    String? team1_logo,
    String? team2_logo,
    List<player>? team1_player,
    List<player>? teamp2_player,
  }) {
    return runningcontest(
      contest_name: contest_name ?? this.contest_name,
      status: status ?? this.status,
      team1_name: team1_name ?? this.team1_name,
      team2_name: team2_name ?? this.team2_name,
      team1_logo: team1_logo ?? this.team1_logo,
      team2_logo: team2_logo ?? this.team2_logo,
      team1_player: team1_player ?? this.team1_player,
      teamp2_player: teamp2_player ?? this.teamp2_player,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contest_name': contest_name,
      'status': status,
      'team1_name': team1_name,
      'team2_name': team2_name,
      'team1_logo': team1_logo,
      'team2_logo': team2_logo,
      'team1_player': team1_player.map((x) => x.toMap()).toList(),
      'teamp2_player': teamp2_player.map((x) => x.toMap()).toList(),
    };
  }

  factory runningcontest.fromMap(Map<String, dynamic> map) {
    return runningcontest(
      contest_name: map['contest_name'] as String,
      status: map['status'] as String,
      team1_name: map['team1_name'] as String,
      team2_name: map['team2_name'] as String,
      team1_logo: map['team1_logo'] as String,
      team2_logo: map['team2_logo'] as String,
      team1_player: List<player>.from((map['team1_player'] as List<int>).map<player>((x) => player.fromMap(x as Map<String,dynamic>),),),
      teamp2_player: List<player>.from((map['teamp2_player'] as List<int>).map<player>((x) => player.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory runningcontest.fromJson(String source) => runningcontest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'runningcontest(contest_name: $contest_name, status: $status, team1_name: $team1_name, team2_name: $team2_name, team1_logo: $team1_logo, team2_logo: $team2_logo, team1_player: $team1_player, teamp2_player: $teamp2_player)';
  }

  @override
  bool operator ==(covariant runningcontest other) {
    if (identical(this, other)) return true;
  
    return 
      other.contest_name == contest_name &&
      other.status == status &&
      other.team1_name == team1_name &&
      other.team2_name == team2_name &&
      other.team1_logo == team1_logo &&
      other.team2_logo == team2_logo &&
      listEquals(other.team1_player, team1_player) &&
      listEquals(other.teamp2_player, teamp2_player);
  }

  @override
  int get hashCode {
    return contest_name.hashCode ^
      status.hashCode ^
      team1_name.hashCode ^
      team2_name.hashCode ^
      team1_logo.hashCode ^
      team2_logo.hashCode ^
      team1_player.hashCode ^
      teamp2_player.hashCode;
  }
}
