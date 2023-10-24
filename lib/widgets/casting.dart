import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:peliculas_2023/models/credits_response.dart";
import "package:peliculas_2023/providers/movies_provider.dart";
import "package:provider/provider.dart";

class Casting extends StatelessWidget {
  final int movieId;
  const Casting({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final size = MediaQuery.of(context).size; //Variable para el tamaño
    return FutureBuilder(
        future: moviesProvider.getMoviesCast(movieId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 180,
              child: CupertinoActivityIndicator(),
            );
          }
          final List<Cast> cast = snapshot.data!;
          return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(cast[index]),
            ),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage(actor.fullProfilePath),
            height: 140,
            width: 100,
            ),
            ),
            SizedBox(height: 5,),
            Text(
              actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}