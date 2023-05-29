import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<OnButtonClicked>(_onButtonClicked);
    on<OnReset>(_onReset);
  }

  void _onButtonClicked(OnButtonClicked event, Emitter<MainState> emit) {
    final input = int.parse(event.input);
    switch (input) {
      case 1:
        {
          List<dynamic> temp = [];
          for (int i = 1; i <= input; i++) {
            temp.add(i);
          }
          emit(state.copyWith(result: temp));
          break;
        }
      case 2:
        {
          List<dynamic> temp = [];
          for (int i = 1; i <= input; i++) {
            temp.add(i);
          }
          for (int i = input - 1; i >= 1; i--) {
            temp.add(i);
          }
          emit(state.copyWith(result: temp));
          break;
        }
      case 3:
        {
          int start = 1;
          List<dynamic> temp = [];
          for (int i = 0; i < input; i++) {
            int result = start + (i * 11);
            temp.add(result);
          }
          emit(state.copyWith(result: temp));
          break;
        }
      case 4:
        {
          List<dynamic> temp = [];

          for (int i = 1; i <= input; i++) {
            if (i % 5 == 0) {
              temp.add('LIMA');
            } else if (i % 7 == 0) {
              temp.add('TUJUH');
            } else {
              temp.add(i);
            }
          }
          emit(state.copyWith(result: temp));
          break;
        }
      default:
        break;
    }
  }

  void _onReset(OnReset event, Emitter<MainState> emit) {
    emit(state.copyWith(input: '', result: []));
  }
}
