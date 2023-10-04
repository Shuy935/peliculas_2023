import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_2023/models/movie.dart';

class CardSwipper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwipper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*.6,
        itemHeight: size.height*.4,
        itemBuilder: (_, int index){
          final movie = movies[index];
          print(movie.posterPath);
          print(movie.fullPosterImg);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', 
            arguments: ''),
            child: ClipRRect( //hace las cosas redondeadas
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage( //pone el placeholder y cuando cargue lo reemplaza con la imagen
                placeholder: AssetImage('assets/foto.jpeg'), image: NetworkImage(movie.fullPosterImg)),
            ), 
          );
        },
      ),
    );
  }
}