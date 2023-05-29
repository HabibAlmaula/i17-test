part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

final class OnButtonClicked extends MainEvent {
  final String input;

  const OnButtonClicked({required this.input});

  @override
  List<Object> get props => [input];
}

final class OnReset extends MainEvent {}
