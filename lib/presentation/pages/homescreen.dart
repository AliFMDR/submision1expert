import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_watchlist_page.dart';
import 'package:flutter/material.dart';

import 'home_movie_page.dart';
import 'tv_home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeMoviePage(),
    HomeTvPage(),
    WatchlistMoviesPage(),
    WatchlistTvPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bioskop 21'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
            label: 'movies',
            icon: Icon(
              Icons.movie_creation,
              color: Colors.black,
            )),
        BottomNavigationBarItem(
            label: 'tv',
            icon: Icon(
              Icons.tv_off,
              color: Colors.black,
            )),
        BottomNavigationBarItem(
            label: 'watchlistmovie',
            icon: Icon(
              Icons.local_movies,
              color: Colors.black,
            )),
        BottomNavigationBarItem(
            label: 'watchlisttv',
            icon: Icon(
              Icons.reset_tv,
              color: Colors.black,
            ))
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}
