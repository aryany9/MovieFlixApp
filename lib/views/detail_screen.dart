import 'package:progressive_image/progressive_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/controllers/movieDetailController.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  final MovieDetailController controller = Get.put(MovieDetailController());
  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const LinearProgressIndicator()
            : Stack(
                fit: StackFit.expand,
                children: [
                  ProgressiveImage(
                    placeholder: NetworkImage(
                        'https://image.tmdb.org/t/p/original${controller.details.value?.backdropPath}'),
                    // size: 1.87KB
                    thumbnail: NetworkImage(
                        'https://image.tmdb.org/t/p/original${controller.details.value?.backdropPath}'),
                    // size: 1.29MB
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w342${controller.details.value?.posterPath}',
                    ),
                    height: Get.height,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.details.value!.title!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  '${controller.details.value!.voteAverage}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.alarm,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              ' ${format(Duration(minutes: controller.details.value!.runtime!))}'
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.details.value!.overview!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
      ),
    );
  }
}
