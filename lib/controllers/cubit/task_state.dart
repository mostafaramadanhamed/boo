part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  final List<TaskModel> tasks;

  const TaskState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

final class TaskInitial extends TaskState {
   TaskInitial() : super([]);
}

final class UpdateTask extends TaskState {
  const UpdateTask(super.tasks);
}