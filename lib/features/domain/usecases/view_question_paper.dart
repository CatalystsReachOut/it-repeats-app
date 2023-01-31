import 'package:it_repeats/features/domain/repositories/it_repeats_repository.dart';

class ViewQuestionPaper {
  final ItRepeatsRepository itRepeatsRepository;

  ViewQuestionPaper({required this.itRepeatsRepository});

  Future<void> call(String fileURL) {
    return itRepeatsRepository.viewQuestionPaper(fileURL);
  }
}
