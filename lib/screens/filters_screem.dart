import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
Function SaveFilter;
  Map<String ,bool>filtersState;

FilterScreen(this.filtersState,this.SaveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegen = false;
  var lactose = false;
@override
initState(){
  glutenFree=widget.filtersState['gluten'];
  vegetarian=widget.filtersState['vegetarian'];
  vegen=widget.filtersState['vegan'];

  lactose=widget.filtersState['lactose'];
}
  Widget buildSwitchTile(String titel, bool type, Function updateval) {
    return SwitchListTile(
      title: Text(titel),
      value: type,
      onChanged: updateval,
      subtitle: Text('Only include ${titel} meals.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
            final selectedFilter={

              'gluten':glutenFree,
              'lactose':lactose,
              'vegan':vegen,
              'vegetarian':vegetarian,
            };
            widget.SaveFilter(selectedFilter);})
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile('gluten-free', glutenFree, (val) {
                setState(() {
                  glutenFree = val;
                });
              }),
              buildSwitchTile('lactos', lactose, (val) {
                setState(() {
                  lactose = val;
                });
              }),
              buildSwitchTile('vegen', vegen, (val) {
                setState(() {
                  vegen = val;
                });
              }),
              buildSwitchTile('vegen', vegetarian, (val) {
                setState(() {
                  vegetarian = val;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
