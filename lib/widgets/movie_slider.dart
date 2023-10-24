import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title; //opcional
  const MovieSlider({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Colors.indigo,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20), //separacion Horizontal de 20 pixeles
          child: Text(
            'Populares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (_, int index) => _MoviePoster(movie: movies[index]),
          ),
        )
      ]),
    );
  }
}

//Crear las tarjetas
class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/camarita.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 150,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
