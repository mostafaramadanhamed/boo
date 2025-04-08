
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
class CounterCubit extends Cubit<CounterState> {
  CounterCubit():super(const CounterInit());

// increment method to increase the count by 1
  void increment(){
    emit(CounterUpdate(state.count + 1));    
  }
// decrement method to decrease the count by 1
  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }
// reset method to set the count to 0
  void reset() {
    emit(const CounterInit());
  }

}
