import 'package:get_it/get_it.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movie_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movies_use_case.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controllers/movie_details_bloc.dart';
import '../../movies/presentation/controllers/movies_bloc.dart';

// service locator
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // the differance between registerFactory and  registerLazySingleton
    // is that factory every time create new object and reload the data
    // like facebook posts
    // lazySingleTone only one data come and only creation and
    // only hashCode

    // Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(
          sl(),
          sl(),
        ));

    // Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    // repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    // Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
