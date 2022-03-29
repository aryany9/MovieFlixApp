// To parse this JSON data, do
//
//     final nowPlayingModel = nowPlayingModelFromJson(jsonString);

import 'dart:convert';

NowPlayingModel nowPlayingModelFromJson(String str) =>
    NowPlayingModel.fromJson(json.decode(str));

String nowPlayingModelToJson(NowPlayingModel data) =>
    json.encode(data.toJson());

class NowPlayingModel {
  NowPlayingModel({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Dates? dates;
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory NowPlayingModel.fromJson(Map<String, dynamic> json) =>
      NowPlayingModel(
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates == null ? null : dates?.toJson(),
        "page": page,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  DateTime? maximum;
  DateTime? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum:
            json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum:
            json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum": maximum == null
            ? null
            : "${maximum?.year.toString().padLeft(4, '0')}-${maximum?.month.toString().padLeft(2, '0')}-${maximum?.day.toString().padLeft(2, '0')}",
        "minimum": minimum == null
            ? null
            : "${minimum?.year.toString().padLeft(4, '0')}-${minimum?.month.toString().padLeft(2, '0')}-${minimum?.day.toString().padLeft(2, '0')}",
      };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"] == null
            ? null
            : originalLanguageValues.map?[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage == null
            ? null
            : originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginalLanguage { EN, FR, JA }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ja": OriginalLanguage.JA
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
