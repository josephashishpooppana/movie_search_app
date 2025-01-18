import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import 'widgets/movie_item.dart';

class MovieSearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search for a movie',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    BlocProvider.of<MovieBloc>(context)
                        .add(SearchMovie(_controller.text));
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MovieItem(movie: state.movies[index]);
                    },
                  );
                } else if (state is MovieError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('Search for a movie'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
