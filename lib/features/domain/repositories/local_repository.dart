// TODO: Add a local repository containing use case functions' definition
import '../entities/question_paper_entity.dart';

abstract class LocalRepository{
  Future<void> searchQuestionPaper(QuestionPaperEntity questionPaperEntity);
  Future<void> viewQuestionPaper(QuestionPaperEntity questionPaperEntity);
}