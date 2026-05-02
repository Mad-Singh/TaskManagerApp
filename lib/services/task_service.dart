import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../models/task.dart';

class TaskService {
  // Create a new task
  static Future<Map<String, dynamic>> createTask(Task task) async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user == null) {
      return {'success': false, 'message': 'User not authenticated'};
    }

    final parseTask = task.toParse();
    parseTask.set('user', user);

    final response = await parseTask.save();

    if (response.success) {
      return {
        'success': true,
        'message': 'Task created successfully!',
        'task': Task.fromParse(response.result as ParseObject),
      };
    } else {
      return {
        'success': false,
        'message': response.error?.message ?? 'Failed to create task',
      };
    }
  }

  // Read all tasks for current user
  static Future<List<Task>> getTasks() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user == null) return [];

    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('Task'))
      ..whereEqualTo('user', user)
      ..orderByDescending('createdAt');

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!
          .map((e) => Task.fromParse(e as ParseObject))
          .toList();
    }
    return [];
  }

  // Update a task
  static Future<Map<String, dynamic>> updateTask(Task task) async {
    if (task.objectId == null) {
      return {'success': false, 'message': 'Task ID is required'};
    }

    final parseTask = ParseObject('Task')..objectId = task.objectId;
    parseTask.set('title', task.title);
    parseTask.set('description', task.description);
    parseTask.set('isCompleted', task.isCompleted);

    final response = await parseTask.save();

    if (response.success) {
      return {'success': true, 'message': 'Task updated successfully!'};
    } else {
      return {
        'success': false,
        'message': response.error?.message ?? 'Failed to update task',
      };
    }
  }

  // Delete a task
  static Future<Map<String, dynamic>> deleteTask(String objectId) async {
    final parseTask = ParseObject('Task')..objectId = objectId;
    final response = await parseTask.delete();

    if (response.success) {
      return {'success': true, 'message': 'Task deleted successfully!'};
    } else {
      return {
        'success': false,
        'message': response.error?.message ?? 'Failed to delete task',
      };
    }
  }

  // Toggle task completion status
  static Future<Map<String, dynamic>> toggleTaskStatus(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    return await updateTask(updatedTask);
  }
}
