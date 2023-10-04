import 'package:flutter/material.dart';

class CastingSlider extends StatelessWidget {
  const CastingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .37,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Casting',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Color.fromARGB(255, 0, 0, 0),
                ),
              )),
              Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, index) =>const _Casting(),
              ),
              ),
        ],
      ),
    );
  }
}

class _Casting extends StatelessWidget {
  const _Casting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      color: Color.fromARGB(255, 255, 255, 255),
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
          const Text('Inserte rasgos aqui',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}