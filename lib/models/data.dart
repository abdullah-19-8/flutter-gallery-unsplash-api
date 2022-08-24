class Post {
  Post({
    required this.results,
  });

  List<Result> results;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.urls,
  });

  Urls urls;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "urls": urls.toJson(),
      };
}

class Urls {
  Urls({
    required this.full,
  });

  String full;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
      };
}
