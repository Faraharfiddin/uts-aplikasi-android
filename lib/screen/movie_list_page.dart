import 'package:flutter/material.dart';

class MovieListPage extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'Inception',
      'year': '2010',
      'poster': 'assets/inception.jpg', // Tambahkan file gambar ke folder assets
    },
    {
      'title': 'Interstellar',
      'year': '2014',
      'poster': 'assets/interstellar.jpg',
    },
    {
      'title': 'The Dark Knight',
      'year': '2008',
      'poster': 'assets/dark_knight.jpg',
    },
    {
      'title': 'Avatar',
      'year': '2009',
      'poster': 'assets/avatar.jpg',
    },
  ];

  MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                movie['poster']!,
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
              title: Text(movie['title']!),
              subtitle: Text('Year: ${movie['year']}'),
              onTap: () {
                // Tambahkan navigasi ke detail jika diperlukan
              },
            ),
          );
        },
      ),
    );
  }
}
