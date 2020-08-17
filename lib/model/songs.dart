class Songs {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  Songs(this.id, this.popularity, this.title, this.backPoster, this.poster,
      this.overview, this.rating);

  Songs.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"].toDouble(),
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}
