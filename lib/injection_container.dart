import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:it_repeats/core/platform/network_info.dart';
import 'package:it_repeats/features/data/datasources/remote_data_source.dart';
import 'package:it_repeats/features/data/repositories/it_repeats_repository_impl.dart';
import 'package:it_repeats/features/domain/repositories/it_repeats_repository.dart';
import 'package:it_repeats/features/domain/usecases/search_question_paper.dart';
import 'package:it_repeats/features/presentation/bloc/it_repeats_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Features - It Repeats
  //     Bloc
  sl.registerFactory(
    () => ItRepeatsBloc(
      sl(),
    ),
  );

  //     Use Cases
  sl.registerLazySingleton(() => FetchQuestionPaper(itRepeatsRepository: sl()));

  //     Repository
  sl.registerLazySingleton<ItRepeatsRepository>(
    () => ItRepeatsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //      Data Source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
