import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_dm.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/util/app_colors.dart';

import '../../movie_details/movie_details.dart';

Future<List<MovieDm>> fetchMovies(String query) async {
  final url = 'https://yts.mx/api/v2/list_movies.json?query_term=$query';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List movies = jsonData['data']['movies'] ?? [];
    return movies.map((json) => MovieDm.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}

class SearchTap extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<SearchTap> {
  final TextEditingController _controller = TextEditingController();
  List<MovieDm> _movies = [];
  bool _loading = false;

  void _searchMovies() async {
    setState(() => _loading = true);
    try {
      final movies = await fetchMovies(_controller.text);
      setState(() => _movies = movies);
    } catch (e) {
      print("Error: $e");
      setState(() => _movies = []);
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Movie Title',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _searchMovies,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _loading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: _movies.isEmpty
                          ? Text('No results')
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:20 ,
                                mainAxisSpacing:20,
                                      childAspectRatio: 0.7

                              ),
                              itemCount: _movies.length,
                              itemBuilder: (context, index) {
                                return buildMovieCard(_movies[index]);
                              },
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMovieCard(MovieDm movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetails(movieId: movie.id),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.mediumCoverImage ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.grayishBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "${movie.rating}",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(
                    Icons.star,
                    color: AppColors.yellow,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
