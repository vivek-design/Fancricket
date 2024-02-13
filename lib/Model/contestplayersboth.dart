// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fancrick/Model/player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class contestbothplayer {
  List<player> list_1;
  List<player> list_2;
  contestbothplayer({
    required this.list_1,
    required this.list_2,
  });
  

  contestbothplayer copyWith({
    List<player>? list_1,
    List<player>? list_2,
  }) {
    return contestbothplayer(
      list_1: list_1 ?? this.list_1,
      list_2: list_2 ?? this.list_2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list_1': list_1.map((x) => x.toMap()).toList(),
      'list_2': list_2.map((x) => x.toMap()).toList(),
    };
  }

  factory contestbothplayer.fromMap(Map<String, dynamic> map) {
    return contestbothplayer(
      list_1: List<player>.from((map['list_1'] as List<int>).map<player>((x) => player.fromMap(x as Map<String,dynamic>),),),
      list_2: List<player>.from((map['list_2'] as List<int>).map<player>((x) => player.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory contestbothplayer.fromJson(String source) => contestbothplayer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'contestbothplayer(list_1: $list_1, list_2: $list_2)';

  @override
  bool operator ==(covariant contestbothplayer other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.list_1, list_1) &&
      listEquals(other.list_2, list_2);
  }

  @override
  int get hashCode => list_1.hashCode ^ list_2.hashCode;
}
