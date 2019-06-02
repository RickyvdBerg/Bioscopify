import 'dart:convert';
import 'package:bioscopify/Model/movie.dart';
import 'package:http/http.dart' as http;

class APIService {
  List<Movie> movies;
  
  Future<List<Movie>> getMoviePlayingList() async {
    var response = await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=8089749884abc3ed32377451b7e348fd&language=en-EN&page=1&region=NL');
    Map<String, dynamic> list = json.decode(response.body);
    Iterable result = list['results'];
    movies = result.map((model) => Movie.fromJson(model)).toList();
    return movies;
  }

  Future<List<Movie>> getMovieUpcomingList() async {

    var response = await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=8089749884abc3ed32377451b7e348fd&language=en-EN&page=1&region=NL');

    Map<String, dynamic> list = json.decode(response.body);
    Iterable result = list['results'];

    movies = result.map((model) => Movie.fromJson(model)).toList();

    return movies;
  }
}