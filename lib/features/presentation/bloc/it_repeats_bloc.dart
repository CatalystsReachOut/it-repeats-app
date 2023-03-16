import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/usecases/search_question_paper.dart';

part 'it_repeats_event.dart';
part 'it_repeats_state.dart';

class ItRepeatsBloc extends Bloc<ItRepeatsEvent, ItRepeatsState> {
  final FetchQuestionPaper fetchQuestionPaper;

  ItRepeatsBloc(this.fetchQuestionPaper) : super(ItRepeatsInitial());

  Stream<ItRepeatsState> mapEventToState(ItRepeatsEvent event) async* {
    if (event is GetQuestionPaperEntity) {
      final departmentName = event.departmentName;
      final semester = event.semester;
      final subjectName = event.subject;
      final year = event.year;

      yield Loading();
      final failureOrQuestionPaper = await fetchQuestionPaper(Params(
          departmentName: departmentName,
          semester: semester,
          subjectName: subjectName,
          year: year));

      yield failureOrQuestionPaper.fold(
          (failure) => throw UnimplementedError(),
          (questionPaperEntity) =>
              Loaded(questionPaperEntity: questionPaperEntity));
    }
  }
}
