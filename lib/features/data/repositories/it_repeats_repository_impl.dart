import 'package:dartz/dartz.dart';
import 'package:it_repeats/core/error/failure.dart';
import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/repositories/it_repeats_repository.dart';

class ItRepeatsRepositoryImpl implements ItRepeatsRepository {
  @override
  Future<Either<Failure, QuestionPaperEntity>> fetchQuestionPaper(
      String departmentName, String semester, String subject, String year) {
    // TODO: implement fetchQuestionPaper
    throw UnimplementedError();
  }

  @override
  Future<void> viewQuestionPaper(String fileURL) {
    // TODO: implement viewQuestionPaper
    throw UnimplementedError();
  }
}
