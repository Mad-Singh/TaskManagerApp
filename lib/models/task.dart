import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Task {
  final String? objectId;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Task({
    this.objectId,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.createdAt,
    this.updatedAt,
  });

  // Convert ParseObject to Task
  factory Task.fromParse(ParseObject parseObject) {
    return Task(
      objectId: parseObject.objectId,
      title: parseObject.get<String>('title') ?? '',
      description: parseObject.get<String>('description') ?? '',
      isCompleted: parseObject.get<bool>('isCompleted') ?? false,
      createdAt: parseObject.createdAt,
      updatedAt: parseObject.updatedAt,
    );
  }

  // Convert Task to ParseObject
  ParseObject toParse() {
    final parseObject = ParseObject('Task');
    if (objectId != null) {
      parseObject.objectId = objectId;
    }
    parseObject.set('title', title);
    parseObject.set('description', description);
    parseObject.set('isCompleted', isCompleted);
    return parseObject;
  }

  Task copyWith({
    String? objectId,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
