import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';


class MoviesProvider extends ChangeNotifier {

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '291190f82948e929f06c06ca4bc20814';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>>  moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, 
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
    //TODO revisar el Map

    print('pidiendo actorees');

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    
    print('JSON recibido: $jsonData');
    final credits = CreditsResponse.fromJson(jsonData);

    print('credits.cast');

    moviesCast[movieId] = credits.cast;
    return credits.cast;
  }
}
