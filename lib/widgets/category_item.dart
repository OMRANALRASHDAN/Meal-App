import 'dart:ui';

import 'package:flutter/material.dart';
import 'file:///C:/Users/OMRAN/Desktop/flutter_app_meals/lib/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String Id;


  CategoryItem(this.Id,this.title, this.color);

  void SelectCategory(BuildContext ctx){
Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,arguments: {'id':Id,'title':title});

  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>SelectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Text(title,style:Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
