import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInit()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });

    on<DecrementEvent>((event, emit){
      emit(CounterUpdate(state.count - 1));
    });
  }
}
