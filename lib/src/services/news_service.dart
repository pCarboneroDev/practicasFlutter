import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practicas_flutter/src/models/category_model.dart';
import 'package:practicas_flutter/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'newsapi.org';
final _ENDPOINT = '/v2/top-headlines';
final _APIKEY = '75f32cf515424cf08dda1ff43635a291';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.heart, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.football, 'sports'),
    Category(FontAwesomeIcons.computer, 'technology')
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines(_ENDPOINT);

    categories.forEach((item){
      this.categoryArticles[item.name] = []; // The class 'List' doesn't have an unnamed constructor.
    });
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;

    getArticlesCategory(_ENDPOINT, _selectedCategory);
    notifyListeners();
  }

  List<Article> get getArticulosCategriaSeleccionada => categoryArticles[this._selectedCategory] ?? [];

  getTopHeadlines(String endpoint) async{
    //final url = Uri.https('${_URL_NEWS}/top-headlines?apiKey=$_APIKEY&country=us');

    final url = Uri.https(_URL_NEWS, endpoint, 
      {
        'apiKey': _APIKEY,
        'country': 'us',
      }
    );

    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }


  getArticlesCategory(String endpoint, String category) async {
    if (categoryArticles[category]!.isNotEmpty) return this.categoryArticles[category];

    final url = Uri.https(_URL_NEWS, endpoint, 
      {
        'apiKey': _APIKEY,
        'country': 'us',
        'category': _selectedCategory
      }
    );

    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}