import '../../../core/error/failure.dart';
import '../entities/question_paper_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ItRepeatsRepository {
  Future<Either<Failure, QuestionPaperEntity>> fetchQuestionPaper(
      String departmentName,
      String semester,
      String subject,
      String year,
      String examName);

  Future<void> viewQuestionPaper(String fileURL);
}
