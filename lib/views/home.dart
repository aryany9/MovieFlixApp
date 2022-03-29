import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/views/nowplaying.dart';
import 'package:movieflixapp/views/toprated.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var currentIndex = 0.obs;
  var screens = [NowPlaying(), TopRatedMovies()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) => currentIndex.value = index,
          currentIndex: currentIndex.value,
          items: [
            _bottomNavigationBarItem(
              icon: const Icon(Icons.movie),
              label: "Now Playing",
            ),
            _bottomNavigationBarItem(
              icon: const Icon(Icons.star_border_purple500_rounded),
              label: "Top Rated",
            ),
          ],
        ),
      ),
      body: Obx(() => screens[currentIndex.value]),
    );
  }

  _bottomNavigationBarItem({required Icon icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

  void changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
