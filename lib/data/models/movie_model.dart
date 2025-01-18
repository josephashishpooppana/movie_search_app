class Movie {
  final String title;
  final String? posterPath;
  final String? releaseDate;

  Movie({required this.title, this.posterPath, this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
    );
  }
}