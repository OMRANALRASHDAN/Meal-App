import 'package:flutter/material.dart';
import 'package:flutter_app_meals/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
     GridView(
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.id,e.title, e.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

            maxCrossAxisExtent: 330,

            childAspectRatio:3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 140),
      );


  }
}
