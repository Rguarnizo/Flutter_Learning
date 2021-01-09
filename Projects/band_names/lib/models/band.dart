import 'package:flutter/foundation.dart';

class Band {
  String id;
  String name;
  int votes;

  Band({
    this.id,
    this.name,
    this.votes,
  });

  factory Band.fromMap(Map<String, dynamic> obj) =>
      new Band(
        id: obj.containsKey('id')? obj['id']:'no-id', 
        name: obj.containsKey('name')?  obj['name']:'no-id', 
        votes: obj.containsKey('votes')? obj['votes']:'no-id');
}
