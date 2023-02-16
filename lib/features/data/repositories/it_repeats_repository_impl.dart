import 'package:dartz/dartz.dart';
import 'package:it_repeats/core/error/exceptions.dart';
import 'package:it_repeats/core/error/failure.dart';
import 'package:it_repeats/core/platform/network_info.dart';
import 'package:it_repeats/features/data/datasources/remote_data_source.dart';
import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';
import 'package:it_repeats/features/domain/repositories/it_repeats_repository.dart';

class ItRepeatsRepositoryImpl implements ItRepeatsRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ItRepeatsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, QuestionPaperEntity>> fetchQuestionPaper(
    String departmentName,
    String semester,
    String subject,
    String year,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.fetchQuestionPaper(
            departmentName, semester, subject, year);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> viewQuestionPaper(String fileURL) {
    // TODO: implement viewQuestionPaper
    throw UnimplementedError();
  }
}
