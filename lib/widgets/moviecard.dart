import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/controllers/nowplayingController.dart';
import 'package:movieflixapp/models/nowplayingmodel.dart';

class MovieCard extends StatelessWidget {
  final TMDBController controller = Get.find<TMDBController>();
  Result result;
  int id;
  int index;
  MovieCard(
      {Key? key, required this.result, required this.id, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w342${result.posterPath}',
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.amber,
            ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            fit: BoxFit.cover,
            height: 150,
            width: 100,
          ),
          Expanded(
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(10),
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    result.originalTitle!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      result.overview!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    child: const Text(
                      "Delete",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      switch (id) {
                        case 0:
                          controller.allNowPlayingMovies!.removeAt(index);

                          break;
                        case 1:
                          controller.allTopRatedMovies!.removeAt(index);

                          break;

                        default:
                          null;
                      }
                    },
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
