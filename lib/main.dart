import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_meals/dummy_data.dart';
import './models/meal.dart';
import 'package:flutter_app_meals/screens/filters_screem.dart';
import 'package:flutter_app_meals/screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availabelMeals = DUMMY_MEALS;
  List<Meal> Favoritian = [];

  void setFilter(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availabelMeals = DUMMY_MEALS.where((element) {
        if (filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (filters['vegan'] && !element.isVegan) {
          return false;
        }

        if (filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }

        if (filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(mealId) {
    final ExIndex = Favoritian.indexWhere((element) => element.id == mealId);
    if (ExIndex >= 0) {
      setState(() {
        Favoritian.removeAt(ExIndex);
      });
    } else {
      setState(() {
        Favoritian.add(
            DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }
bool isMealFavorite(String id){
    return Favoritian.any((element) => element.id==id);

}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      initialRoute: '/',
      // home:CategoriesScreen (),
      routes: {
        '/': (ctx) => TapScreen(Favoritian),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availabelMeals),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(toggleFavorite,isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilter)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (cyx) => CategoriesScreen());
      },
    );
  }
}
