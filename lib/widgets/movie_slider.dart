import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .37,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populares',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                ),
              )),
              Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, index) =>const _MoviePoster(),
              ),
              ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      color: Color.fromARGB(255, 46, 85, 241),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/foto.jpeg'),
                image: AssetImage('assets/foto.jpeg'),
                width: 130,
                height: 165,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          const Text('Miau miau miau miau miau miau miau miau miau miau miau miau miau miau ',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}