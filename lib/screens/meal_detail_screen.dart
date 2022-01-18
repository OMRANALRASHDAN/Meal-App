import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal-detail';
Function selectFavorite;
  Function IsFavorieMeal;

MealDetailScreen(this.selectFavorite,this.IsFavorieMeal);
  Widget buildSectionTitle(BuildContext ctx, String Title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        Title,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: 200,
      width: 320,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemCount: selectMeal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        selectMeal.ingredients[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                );
              },
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectMeal.steps[index]),
                  ),
                  Divider()
                ],
              ),
              itemCount: selectMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(IsFavorieMeal(mealId)?Icons.star:Icons.star_border),
        onPressed: () =>selectFavorite(mealId)

        // Navigator.of(context).pop(mealId);
        ,
      ),
    );
  }
}
