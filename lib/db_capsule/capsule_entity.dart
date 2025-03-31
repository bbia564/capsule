import 'dart:convert';

import 'package:intl/intl.dart';

class CapsuleEntity {
  int id;
  DateTime createdTime;
  String title;

  CapsuleEntity({
    required this.id,
    required this.createdTime,
    required this.title,
  });

  factory CapsuleEntity.fromJson(Map<String, dynamic> json) {
    return CapsuleEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'title': title,
    };
  }
}

class CapsuleItem {
  int id;
  DateTime createdTime;
  CapsuleEntity entity;
  DateTime startTime;
  DateTime endTime;
  String content;

  CapsuleItem({
    required this.id,
    required this.createdTime,
    required this.entity,
    required this.startTime,
    required this.endTime,
    required this.content,
  });

  factory CapsuleItem.fromJson(Map<String, dynamic> json) {
    return CapsuleItem(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      entity: CapsuleEntity.fromJson(jsonDecode(json['entity'])),
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'entity': jsonEncode(entity.toJson()),
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'content': content,
    };
  }

  String get endTimeStr => DateFormat('MM/dd/yyyy').format(endTime);

  bool get endTimeOut => DateTime.now().isAfter(endTime);
}
