import 'package:flutter/material.dart';
import 'package:movies_app/util/app_colors.dart';
import '../../../models/movie_dm.dart';
import '../../movie_details/movie_details.dart';

class BroweseScreen extends StatefulWidget {
  const BroweseScreen({super.key});

  @override
  State<BroweseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BroweseScreen>
    with SingleTickerProviderStateMixin {
  final List<String> genres = ['Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi'];

  final List<MovieDm> sampleMovies = List.generate(
    10,
    (index) => MovieDm(
      id: index,
      title: 'Movie $index',
      rating: (7 + index % 3).toDouble(),
      mediumCoverImage:
          'https://via.placeholder.com/300x450.png?text=Movie+$index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genres.length,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // TabBar for genres
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: AppColors.yellow,
                unselectedLabelColor: AppColors.yellow,
                tabs: genres
                    .map((genre) => Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(16)),
                        child: Tab(text: genre)))
                    .toList(),
              ),
            ),

            Expanded(
              child: TabBarView(
                children: genres.map((genre) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: sampleMovies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      return buildMovieCard(sampleMovies[index]);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
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
