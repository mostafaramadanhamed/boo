import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void addTask(TaskModel task) {
    emit(UpdateTask([...state.tasks, task]));
  }
  void removeTask(int id) {
    final updatedTasks = state.tasks..where((task) => task.id != id).toList();
    emit(UpdateTask(updatedTasks));
  }
  void toggleTask(int id) {
    final updatedTasks = state.tasks.map((task) {
     
      return task.id== id
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(UpdateTask(updatedTasks));
  }
}
