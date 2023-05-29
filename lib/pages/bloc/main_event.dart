part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

final class OnButtonClicked extends MainEvent {
  final String input;
  final int button;

  const OnButtonClicked({required this.input, required this.button});

  @override
  List<Object> get props => [input, button];
}

final class OnReset extends MainEvent {}
