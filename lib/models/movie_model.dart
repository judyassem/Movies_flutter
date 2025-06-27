class MovieModel {
  final String image;
  final String title;
  final String? rating;
  MovieModel({required this.image, required this.title, required this.rating});
  static final List<MovieModel> movies = [
    MovieModel(
      title: '1917',
      rating: "7.7",
      image: "assets/Movies Posters.png",
    ),
    MovieModel(
      title: "Discover Movies",
      rating: "7.7",
      image: "assets/movie_poster_1.png",
    ),
    MovieModel(
      title: "Explore All Genres",
      rating: "7.7",
      image: "assets/movie_poster_2.png",
    ),
    MovieModel(
      title: "Create Watchlists",
      rating: "7.7",
      image: "assets/movie_poster_3.png",
    ),
    MovieModel(
      title: "Rate, Review, and Learn",
      rating: "7.7",
      image: "assets/movie_poster_4.png",
    ),
    MovieModel(
        title: "Start Watching Now",
        image: "assets/movie_poster_5.png",
        rating: "7.7"),
  ];
}
