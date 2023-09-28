import 'package:flutter/material.dart';
import 'package:peliculas_2023/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy:  false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelicula',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (context) => DetailsScreen(), 
      },
    ); 
  }
}