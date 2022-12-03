import 'package:isar/isar.dart';

part 'atask.g.dart';

enum TaskState {
  open,
  done,
}

@collection
class ATask {
  Id? id = Isar.autoIncrement;

  late String summary;
  String? description;

  DateTime? dueDate;

  @enumerated
  TaskState state = TaskState.open;

  List<TaskStep>? steps;

  late DateTime createdAt;
  late DateTime modifiedAt;

  ATask({this.id, required this.summary}) {
    createdAt = DateTime.now();
    modifiedAt = DateTime.now();
  }
}

@embedded
class TaskStep {
  String? summary;

  @enumerated
  TaskState state = TaskState.open;
}
