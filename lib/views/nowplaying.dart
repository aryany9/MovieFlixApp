import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/controllers/nowplayingController.dart';
import 'package:movieflixapp/widgets/moviecard.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> with TickerProviderStateMixin {
  final TMDBController controller = Get.put(TMDBController());
  late AnimationController _controller;

  double textWidth = 300.0;
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                      controller.searchNowPlayingMovie(value);
                    } else {
                      controller.fetchNowplayingList();
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

//                border: InputBorder.none,
//                hintText: "My Custom Search Label", // KEY PROP
                    // hintStyle: const TextStyle(color: Colors.red), // KEY PROP
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
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.allNowPlayingMovies!.length,
          itemBuilder: (context, index) => Obx(
            () => InkWell(
              onTap: () {
                Get.toNamed(
                    '/MovieDetails/${controller.allNowPlayingMovies!.value[index].id}');
              },
              child: MovieCard(
                result: controller.allNowPlayingMovies![index],
                id: 0,
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
