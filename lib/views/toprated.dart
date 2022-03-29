import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/controllers/nowplayingController.dart';
import 'package:movieflixapp/widgets/moviecard.dart';

class TopRatedMovies extends StatefulWidget {
  TopRatedMovies({Key? key}) : super(key: key);

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies>
    with TickerProviderStateMixin {
  final TMDBController controller = Get.put(TMDBController());
  bool _folded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _folded ? Get.width / 2 : Get.width,
          alignment: _folded ? Alignment.center : Alignment.centerLeft,

//            color: Colors.red,
          child: _folded
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _folded = !_folded;
                    });
                  },
                  child: Row(children: const <Widget>[
                    Icon(Icons.search),
                    SizedBox(width: 5),
                    Text("Search Something...")
                  ]),
                )
              : TextField(
                  autofocus: true,
                  controller: controller.textFieldController,
                  onChanged: (value) {
                    if (value != "") {
                      controller.searchTopRatedMovie(value);
                    } else {
                      controller.fetchTopRatedMovies();
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search something ...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
        ),
        actions: [
          Get.isDarkMode
              ? IconButton(
                  onPressed: changeTheme,
                  icon: const Icon(Icons.light_sharp),
                )
              : IconButton(
                  onPressed: changeTheme,
                  icon: const Icon(CupertinoIcons.moon_stars_fill),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: List.generate(
                controller.allTopRatedMovies!.length,
                (index) => InkWell(
                      onTap: () {
                        Get.toNamed(
                            '/MovieDetails/${controller.allTopRatedMovies![index].id}');
                      },
                      child: MovieCard(
                        result: controller.allTopRatedMovies![index],
                        id: 1,
                        index: index,
                      ),
                    )),
          ),
        ),
      ),
    );
  }

  void changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
