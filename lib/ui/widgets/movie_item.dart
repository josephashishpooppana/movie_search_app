import 'package:flutter/material.dart';
import '../../data/models/movie_model.dart';


class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.posterPath != null && movie.posterPath!.isNotEmpty
          ? Image.network(
              'https://image.tmdb.org/t/p/w92${movie.posterPath}',
              width: 92,
              height: 138, // Maintaining aspect ratio of the poster
              errorBuilder: (context, error, stackTrace) {
                return _buildImageNotFoundPlaceholder();
              },
            )
          : _buildImageNotFoundPlaceholder(),
      title: Text(movie.title),
      subtitle: Text('Release Date: ${movie.releaseDate ?? 'Unknown'}'),
    );
  }

  Widget _buildImageNotFoundPlaceholder() {
    return Container(
      width: 92,
      height: 138, // Maintaining aspect ratio of the poster
      color: Colors.grey[300],
      child: Center(
        child: Text(
          'Image\nNot Found',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
