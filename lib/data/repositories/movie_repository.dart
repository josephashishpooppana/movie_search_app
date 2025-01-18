import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieRepository {
  final String apiKey = dotenv.env['TMDB_API_KEY']!;
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
