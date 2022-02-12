import 'dart:convert';
import 'dart:ffi';

class Activities {
  int? id;
  String? name;

  Activities({this.id, this.name});

  // convert json data
  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(
        id: json['activities']['id'], name: json['activities']['name']);
  }
}
