import 'package:flutter/material.dart';
import 'package:movies_app/common%20_widget/filled_button.dart';
import 'package:movies_app/models/movie_dm.dart';
import 'package:movies_app/util/app_colors.dart';

import '../../api_manager/movies_api_manager.dart';

class MovieDetails extends StatefulWidget {
  final int? movieId;
  static String routeName = "movieDetailsScreen";

  const MovieDetails({super.key, this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Future<MovieDm?> theMovie;

  @override
  void initState() {
    super.initState();
    theMovie = MoviesApiManager().getMovieDetails(widget.movieId!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: theMovie,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;
            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: ListView(
                  children: [
                    MovieHeaderWidget(movie),
                    SizedBox(height: 16),

                    SectionTitle("Screen Shots"),
                    //ScreenshotList(screenshots: movie.screenshots),
                    SizedBox(height: 16),

                    // Similar Movies
                    SectionTitle("Similar"),
                    //SimilarMoviesList(movie.id),

                    SizedBox(height: 16),

                    // Summary
                    SectionTitle("Summary"),
                    Text(movie.summary ?? "No Summary",
                        style: TextStyle(color: Colors.white)),

                    SizedBox(height: 16),

                    // Cast
                    SectionTitle("Cast"),
                    //CastList(cast: movie.cast),

                    SizedBox(height: 16),

                    // Genres (wrap)
                    SectionTitle("Genres"),
                    GenreChips(movie.genres ?? []),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  MovieHeaderWidget(MovieDm movie) {
    return Column(children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            movie.largeCoverImage ?? " ",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Row(
            children: [
            IconButton(
                    onPressed: (){Navigator.pop(context);},
                    icon: Icon(Icons.arrow_back_ios_new , color: AppColors.white,)),
            Spacer(),
            IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.bookmark_outlined , color: AppColors.white,))
          ],
          ),
          Positioned(
            top: 300,
            child: Icon(
              Icons.play_circle_filled,
              size: 64,
              color: AppColors.yellow,
            ),
          ),
          Positioned(
              bottom: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(movie.title ?? "no title",
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white ,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,)),
              )),
          Positioned(
            bottom: 15,
            child: Text(movie.year.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ],
      ),
      CustomFilledButton(
          text: "Watch",
          textFontSize: 20,
          textColor: AppColors.white,
          backgroundColor: WidgetStatePropertyAll(AppColors.red),
          onClick: () {}),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[850] ,borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          child: Row(children: [
            Icon(
              Icons.favorite,
              color: AppColors.yellow,
              size: 24,
            ),
            SizedBox(width: 9,),
            Text(movie.rating.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ]),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.grey[850] ,borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          child: Row(children: [
            Icon(
              Icons.access_time_filled,
              color: AppColors.yellow,
              size: 24,
            ),
            SizedBox(width: 9,),
            Text(movie.runtime.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ]),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.grey[850] ,borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          child: Row(children: [
            Icon(
              Icons.star_rounded,
              color: AppColors.yellow,
              size: 24,
            ),
            SizedBox(width: 9,),
            Text(movie.rating.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ]),
        )
      ])
    ]);
  }

  ScreenshotList({required screenshots}) {}

  // SimilarMoviesList(int? id) {
  //   return FutureBuilder(
  //     future: MoviesApiManager().getMovieSuggestions(id!),
  //     builder: (context,snapshot){
  //       if(snapshot.hasError){
  //
  //       }
  //     },
  //   );
  // }

  SectionTitle(String s) {
    return Text(s ,
      textAlign: TextAlign.start,
      style: TextStyle(color: AppColors.white ,fontSize: 24, fontWeight: FontWeight.bold)
    );
  }

  CastList({required cast}) {}

  GenreChips(List<String> genres) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: genres.map((genre) => ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
          ),
          child: Text(genre),
        )).toList(),
      ),
    );
  }
}
