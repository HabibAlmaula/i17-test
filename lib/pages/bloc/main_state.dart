part of 'main_bloc.dart';

class MainState extends Equatable {
  final String input;
  final List<dynamic> result;

  const MainState({this.input = '', this.result = const []});

  MainState copyWith({
    String? input,
    List<dynamic>? result,
  }) {
    return MainState(
      input: input ?? this.input,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [
        input,
        result,
      ];
}
