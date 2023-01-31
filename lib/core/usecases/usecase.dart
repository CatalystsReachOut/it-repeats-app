import 'package:dartz/dartz.dart';
import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, QuestionPaperEntity>> call(Params params);
}
