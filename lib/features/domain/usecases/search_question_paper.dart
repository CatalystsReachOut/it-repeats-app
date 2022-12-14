import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/repositories/local_repository.dart';

class FetchQuestionPaper {
  late final LocalRepository localRepository;

  FetchQuestionPaper({required this.localRepository});
  Future<void> call(QuestionPaperEntity questionPaperEntity) {
    return localRepository.fetchQuestionPaper(questionPaperEntity);
  }
}
