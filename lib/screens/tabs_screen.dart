import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_app_meals/widgets/main_drawer.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TapScreen extends StatefulWidget {
  final List<Meal>Favorited;
  TapScreen(this.Favorited);
  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
   List<Map<String, Object>> Pages ;
@override
  initState(){
  Pages= [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(widget.Favorited),
      'title': 'Favorite',
    }
  ];

  }
  int selectpageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectpageIndex = index;
      print(selectpageIndex);
    });
  }

  static const routeName = '/tabs-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Pages[selectpageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: Pages[selectpageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectpageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text(
                'Categories',
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text(
                'Favorite',
              )),
        ],
      ),
    );
  }
}
