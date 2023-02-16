part of 'it_repeats_bloc.dart';

abstract class ItRepeatsState extends Equatable {
  const ItRepeatsState([List props = const <dynamic>[]]);
}

class ItRepeatsInitial extends ItRepeatsState {
  @override
  List<Object> get props => [];
}

class Empty extends ItRepeatsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends ItRepeatsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends ItRepeatsState {
  final QuestionPaperEntity questionPaperEntity;

  const Loaded({required this.questionPaperEntity});

  @override
  List<Object?> get props => [questionPaperEntity];
}

class Error extends ItRepeatsState {
  final String message;

  const Error({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
