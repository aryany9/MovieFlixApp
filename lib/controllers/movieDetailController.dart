import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:movieflixapp/models/moviedetailmodel.dart';
import 'package:movieflixapp/services/tmdbAPI_service.dart';

class MovieDetailController extends GetxController {
  TextEditingController textFieldController = TextEditingController();
  Rxn<MovieDetailModel> details = Rxn<MovieDetailModel>();
  var isLoading = true.obs;

  @override
  onInit() {
    fetchDetails();
    super.onInit();
  }

  fetchDetails() async {
    isLoading(true);
    var response = await TMDBApiService.getMovieDetails();
    if (response != null) {
      details.value = response;
      isLoading(false);
    } else {
      isLoading(false);
      print(response);
    }
  }
}
