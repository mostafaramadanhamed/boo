import 'dart:async';

import 'package:boo/controllers/cubit/task_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/task_model.dart';


part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);

    on<RemoveTaskEvent>(_removeTask);

    on<ToggleTaskEvent>(_toggleTask);
  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final model = TaskModel(id: DateTime.now().toString(), title: event.title, isCompleted: false);
    emit(UpdateTask([...state.tasksList, model]));
  }

  FutureOr<void> _removeTask(RemoveTaskEvent event, Emitter<TaskState> emit) {
    final List<TaskModel> newList = state.tasksList.where((task) => task.id != event.id).toList();
    emit(UpdateTask(newList));
  }

  FutureOr<void> _toggleTask(ToggleTaskEvent event, Emitter<TaskState> emit) {
    final List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == event.id ? task.copyWith(isCompleted: !task.isCompleted) : task;
    }).toList();

    emit(UpdateTask(newList));
  }
  

  
}