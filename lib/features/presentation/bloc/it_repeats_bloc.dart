import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/usecases/search_question_paper.dart';

part 'it_repeats_event.dart';

part 'it_repeats_state.dart';

class ItRepeatsBloc extends Bloc<ItRepeatsEvent, ItRepeatsState> {
  final FetchQuestionPaper fetchQuestionPaper;

  ItRepeatsBloc(this.fetchQuestionPaper) : super(ItRepeatsInitial()) {
    on<GetQuestionPaperEntity>((event, emit) async {
      final departmentName = event.departmentName;
      final semester = event.semester;
      final subjectName = event.subject;
      final year = event.year;

      emit(Loading());

      final failureOrQuestionPaper = await fetchQuestionPaper(Params(
          departmentName: departmentName,
          semester: semester,
          subjectName: subjectName,
          year: year));

      emit(failureOrQuestionPaper.fold(
          (failure) => throw UnimplementedError(),
          (questionPaperEntity) =>
              Loaded(questionPaperEntity: questionPaperEntity)));
    });
  }
}
