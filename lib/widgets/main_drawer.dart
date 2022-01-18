import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_meals/screens/filters_screem.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String Title,IconData icon,Function TapHandler){

    return  ListTile(
      leading: Icon(
    icon,
        size: 26,
      ),
      title: Text(
        Title,
        style: TextStyle(
            fontFamily: 'RebotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      onTap: TapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 40,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');

          }),

          buildListTile('Filters', Icons.settings,(){

            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);


          })
        ],
      ),
    );
  }
}
