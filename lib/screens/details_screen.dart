import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //recibir argumentos de otra pantalla
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
        slivers: [_CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate.fixed([
          _PosterAndTitle(),
          _PosterAndTitle(),
          _PosterAndTitle(),
          ])),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //WIDGET para que se ajuste al tamaño
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'Movie.Title',
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: AssetImage('assets/foto.jpeg')),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/foto.jpeg'),
              image: AssetImage('assets/foto.jpeg'),
              height: 250,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.title',
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'movie.titleOriginal',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.start_outlined,
                      size: 20,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 5),
                    Text('movie.voteAverage',
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
