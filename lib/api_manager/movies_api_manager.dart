import 'dart:convert';
import 'package:http/http.dart';
import '../models/MoviesResponse.dart';
import '../models/movie_dm.dart';

class MoviesApiManager {
  var moviesBaseUrl = "https://yts.mx/api/v2/";
  var moviesDetailsEndpoint = "movie_details.json";
  var moviesSuggestionEndpoint = "movie_suggestions.json";
  var moviesListEndpoint = "list_movies.json";
  var defaultErrorMessage = "Something went wrong";

  Future<List<MovieDm>?> getMovies() async {
    Uri url = Uri.parse("$moviesBaseUrl$moviesListEndpoint");

    try {
      var serverResponse = await get(url);
      var response = MoviesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode == 200) {
        return response.data?.moviesList;
      } else {
        throw response.statusMessage ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDm?> getMovieDetails(int movieId) async {
    Uri url =
        Uri.parse("$moviesBaseUrl$moviesDetailsEndpoint?movie_id=$movieId");
    try {
      var serverResponse = await get(url);
      var response = MoviesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode == 200) {
        return response.data?.movie;
      } else {
        throw response.statusMessage ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieDm>?> getMovieSuggestions(int movieId) async {
    Uri url =
        Uri.parse("$moviesBaseUrl$moviesSuggestionEndpoint?movie_id=$movieId");
    try {
      var serverResponse = await get(url);
      var response = MoviesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode == 200) {
        return response.data?.moviesList;
      } else {
        throw response.statusMessage ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }
}
