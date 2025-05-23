import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(const CounterInit());

  void increment(BuildContext context) {
    emit(CounterUpdate(state.count + 1));
  }

  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }
  
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    if (json['count'] == null) return null;
    return CounterUpdate(json['count'] as int);
  }
  
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    
      return {'count': state.count};
  
  }


}