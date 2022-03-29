import 'package:get/route_manager.dart';
import 'package:movieflixapp/views/home.dart';
import 'package:movieflixapp/views/detail_screen.dart';
import 'package:movieflixapp/views/nowplaying.dart';

routes() => [
      GetPage(name: '/Homepage', page: () => HomeScreen()),
      GetPage(name: '/NowPlaying', page: () => NowPlaying()),
      GetPage(name: '/MovieDetails/:movieid', page: () => DetailScreen()),
    ];
