import 'package:movies_app/models/movie_dm.dart';

class MoviesData {
  MoviesData({
    this.moviesList,
    this.movie,
  });

  MoviesData.fromJson(dynamic json) {
    if (json['movies'] != null) {
      moviesList = [];
      json['movies'].forEach((v) {
        moviesList?.add(MovieDm.fromJson(v));
      });
    }
    movie = json['movie'] != null ? MovieDm.fromJson(json['movie']) : null;
  }
  List<MovieDm>? moviesList;
  MovieDm? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (moviesList != null) {
      map['movies'] = moviesList?.map((v) => v.toJson()).toList();
    }
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }
}
