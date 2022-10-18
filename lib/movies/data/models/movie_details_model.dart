import 'package:movie_app/movies/data/models/genres_model.dart';

import '../../domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        voteAverage: json['vote_average'].toDouble(),
        genres: List<GenresModel>.from(
          json['genres'].map(
            (x) => GenresModel.fromJson(x),
          ),
        ),
      );
}
