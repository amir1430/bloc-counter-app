import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learining_bloc/Bloc/Events/CounterEvents.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    switch (event) {
      case CounterEvents.Increment:
        yield state + 1;
        break;
      default:
        yield state - 1;
    }
  }

  @override
  void onTransition(Transition<CounterEvents, int> transition) {
    print(transition);
  }
}
