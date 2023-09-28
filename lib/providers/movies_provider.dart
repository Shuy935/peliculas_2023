import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MovieProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _lenguaje = 'es-MX';

  MoviesProvider() {
    getOnDispayMovies();
  }

  getOnDispayMovies() {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'lenguaje': _lenguaje,
      'page': '1',
    });
  }
}
