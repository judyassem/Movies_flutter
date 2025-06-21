import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model.dart';

import '../../../util/app_colors.dart';
import '../../movie_details/movie_details.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          Image.asset(
            "assets/0c5e9a732005a8c14492ae830b4da544d75cac19.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: buildMovieCard(index),
                );
              },
            ),
          ),
          Image.asset(
            "assets/Watch Now.png",
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Action",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "See More  ",
                        style: TextStyle(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.yellow,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildMovieCard(index));
              },
            ),
          )
        ],
      ),
    ]);
  }

  buildMovieCard(int index) {
    final movie = MovieModel.movies[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetails(movie: movie),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              MovieModel.movies[index].image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 35,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColors.grayishBlack,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${MovieModel.movies[index].rating}",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.yellow,
                    size: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
