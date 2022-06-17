import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movieflixapp/models/moviedetailmodel.dart';
import 'package:movieflixapp/models/nowplayingmodel.dart';

class TMDBApiService {
  static var client = http.Client();
  static Future fetchList() async {
    try {
      var response = await client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return NowPlayingModel.fromJson(jsonString);
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: response.reasonPhrase!);
      }
    } on SocketException {
      return null;
    }
  }

  static Future fetchTopRatedList() async {
    try {
      var response = await client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return NowPlayingModel.fromJson(jsonString);
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: response.reasonPhrase!);
      }
    } on SocketException {
      return null;
    }
  }

  static Future searchList(String search) async {
    try {
      var response = await client.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page=1&query=$search'));
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return NowPlayingModel.fromJson(jsonString);
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: response.reasonPhrase!);
      }
    } on SocketException {
      return null;
    }
  }

  static Future getMovieDetails() async {
    String? movieId = Get.parameters['movieid'];
    try {
      var response = await client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page=1&language=en-US'));
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        return MovieDetailModel.fromJson(jsonString);
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: response.reasonPhrase!);
      }
    } on SocketException {
      return null;
    }
  }
}
