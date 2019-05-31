class Movie {
  final int id;
  final int voteCount;

  final double popularity;
  final double score;

  final bool hasVideo = false;
  final bool isAdult = false;

  final String title;
  final String languageCode;
  final String urlPoster;
  final String urlBackdrop;
  final String overview;

  final DateTime releaseDate;

  final List<int> genres;

  //constructor
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

  factory Movie.fromJson(Map<String, dynamic> data) {
    return Movie(
        id: data['id'],
        score: data['vote_average'].toDouble(),
        voteCount: data['vote_count'],
        popularity: data['popularity'],
        title: data['title'],
        languageCode: data['original_language'],
        urlPoster: data['poster_path']  ?? '',
        urlBackdrop: data['backdrop_path'] ?? '',
        overview: data['overview'],
        releaseDate: DateTime.parse(data['release_date']),
        genres: data['genre_ids'].cast<int>());
  }
}
