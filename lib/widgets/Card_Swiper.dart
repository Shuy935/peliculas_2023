import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_2023/models/models.dart';
//Vamos reutilizar este widget

class CardSwiper extends StatelessWidget {
  //nueva propiedad
  final List<Movie> movies;
  //añadimos el movie
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //almacenas el tamaño de la pantalla
    return Container(
      width: double.infinity, //para que el contenedor sera el ancho de pantalla
      height: size.height * 0.5,
      child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK, //forma en que se comporta
          itemWidth: size.width * 0.5,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            //print(movie.posterPath);
            //print(movie.fullPosterImg);
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), //Para hacer las esquinas redondeadas
                child: FadeInImage(
                  placeholder: const AssetImage('assets/foto.jpeg'),
                  image: NetworkImage(movie.fullPosterImg),
                ),
              ),
            );
          }),
    );
  }
}
