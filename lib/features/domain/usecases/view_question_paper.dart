import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/repositories/local_repository.dart';

class ViewQuestionPaper {
  late final LocalRepository localRepository;

  ViewQuestionPaper({required this.localRepository});

  Future<void> call(QuestionPaperEntity questionPaperEntity) {
    return localRepository.viewQuestionPaper(questionPaperEntity);
  }
}
