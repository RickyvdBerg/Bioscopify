class Movie {
  final int id, voteCount;
  final double popularity, score;
  final bool hasVideo = false, isAdult = false;
  final String title, languageCode, urlPoster, urlBackdrop, overview;
  final DateTime releaseDate;
  final List<int> genres;

  Movie(
      {this.id,
      this.score,
      this.voteCount,
      this.popularity,
      this.title,
      this.languageCode,
      this.urlPoster,
      this.urlBackdrop,
      this.overview,
      this.releaseDate,
      this.genres});

  factory Movie.fromJson(Map data) {
    return Movie(
        id: data['id'],
        score: data['vote_average'].toDouble(),
        voteCount: data['vote_count'],
        popularity: data['popularity'],
        title: data['title'],
        languageCode: data['original_language'],
        urlPoster: data['poster_path'],
        urlBackdrop: data['backdrop_path'],
        overview: data['overview'],
        releaseDate: DateTime.parse(data['release_date']),
        genres: data['genre_ids'].cast<int>());
  }
}
