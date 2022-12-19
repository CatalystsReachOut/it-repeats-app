import '../entities/question_paper_entity.dart';

abstract class LocalRepository {
  Future<void> fetchQuestionPaper(QuestionPaperEntity questionPaperEntity);
  Future<void> viewQuestionPaper(QuestionPaperEntity questionPaperEntity);
}
