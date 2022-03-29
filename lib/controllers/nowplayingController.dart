import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/models/nowplayingmodel.dart';
import 'package:movieflixapp/services/tmdbAPI_service.dart';

class TMDBController extends GetxController {
  RxList<Result>? allNowPlayingMovies = RxList<Result>([]);
  RxList<Result>? allTopRatedMovies = RxList<Result>([]);
  TextEditingController textFieldController = TextEditingController();

  @override
  onInit() {
    fetchNowplayingList();
    fetchTopRatedMovies();
    super.onInit();
  }

  fetchNowplayingList() async {
    NowPlayingModel response = await TMDBApiService.fetchList();
    if (response != null) {
      print("Fetched");
      allNowPlayingMovies?.value = response.results!;
      print(allNowPlayingMovies);
    } else {
      print(response);
    }
  }

  fetchTopRatedMovies() async {
    NowPlayingModel response = await TMDBApiService.fetchTopRatedList();
    if (response != null) {
      print("Fetched");
      allTopRatedMovies?.value = response.results!;
      print(allTopRatedMovies);
    } else {
      print(response);
    }
  }

  void searchNowPlayingMovie(String? query) {
    final suggestions = allNowPlayingMovies?.where((element) {
      final movieTitle = element.title!.toLowerCase();
      final input = query!.toLowerCase();

      return movieTitle.contains(input);
    }).toList();

    allNowPlayingMovies?.value = suggestions!;
  }

  void searchTopRatedMovie(String? query) {
    final suggestions = allTopRatedMovies?.value.where((element) {
      final movieTitle = element.title!.toLowerCase();
      final input = query!.toLowerCase();

      return movieTitle.contains(input);
    }).toList();

    allTopRatedMovies?.value = suggestions!;
  }

  searchApiHit(String search) async {
    NowPlayingModel response = await TMDBApiService.searchList(search);
    if (response != null) {
      print("Fetched");
      allNowPlayingMovies?.value = response.results!;
      print(allNowPlayingMovies);
    } else {
      print(response);
    }
  }
}
