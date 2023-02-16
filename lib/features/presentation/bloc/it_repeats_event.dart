part of 'it_repeats_bloc.dart';

abstract class ItRepeatsEvent extends Equatable {
  // const ItRepeatsEvent([List props = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];
}

class GetQuestionPaperEntity extends ItRepeatsEvent {
  final String departmentName;
  final String semester;
  final String subject;
  final String year;

  GetQuestionPaperEntity(
      this.departmentName, this.semester, this.subject, this.year);

  @override
  List<Object> get props => [departmentName, semester, subject, year];
}
