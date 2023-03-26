import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:it_repeats/core/usecases/usecase.dart';
import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/repositories/it_repeats_repository.dart';
import '../../../core/error/failure.dart';

class FetchQuestionPaper implements UseCase<QuestionPaperEntity, Params> {
  final ItRepeatsRepository itRepeatsRepository;

  FetchQuestionPaper({required this.itRepeatsRepository});

  @override
  Future<Either<Failure, QuestionPaperEntity>> call(Params params) async {
    return await itRepeatsRepository.fetchQuestionPaper(params.departmentName,
        params.semester, params.subjectName, params.year, params.examName);
  }
}

class Params extends Equatable {
  final String departmentName;
  final String semester;
  final String subjectName;
  final String year;
  final String examName;

  const Params({
    required this.departmentName,
    required this.semester,
    required this.subjectName,
    required this.year,
    required this.examName,
  });

  @override
  List<Object?> get props =>
      [departmentName, semester, subjectName, year, examName];
}
