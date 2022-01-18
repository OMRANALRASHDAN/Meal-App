import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal>Favorited;
  FavoritesScreen(this.Favorited);
  @override
  Widget build(BuildContext context) {
    if(Favorited.isEmpty){
    return Center(
      child: Text('No Favorite Meals yet'),
    );}
    return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: Favorited[index].id,
            title: Favorited[index].title,
            imageUrl: Favorited[index].imageUrl,
            duration: Favorited[index].duration,
            affordability: Favorited[index].affordability,
            complexity: Favorited[index].complexity,
          );
        },
        itemCount: Favorited.length,
    );
  }
}
