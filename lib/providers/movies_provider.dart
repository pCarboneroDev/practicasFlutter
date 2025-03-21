import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicas_flutter/helpers/debouncer.dart';
import '../models/models.dart';


class MoviesProvider extends ChangeNotifier {

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '291190f82948e929f06c06ca4bc20814';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>>  moviesCast = {};

  int _popularPage = 0;


  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionSream => _suggestionStreamController.stream;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, 
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page'
      }
    );

    var response = await http.get(url);
    return response.body;
  }


  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlaying = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlaying.results;
    notifyListeners();
  }


  getPopularMovies() async {
    _popularPage += 1;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {

    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');

    final credits = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = credits.cast;
    return credits.cast;
  }


  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', 
      {
        'api_key': _apiKey,
        'language': _language,
        'query': query
      }
    );

    final response = await http.get(url);
    final searchResponse = SearchMovieResponse.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovie(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(
      Duration(milliseconds: 300), (_){
        debouncer.value = searchTerm;
      }
    );

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
