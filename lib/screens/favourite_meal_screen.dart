import 'package:flutter/material.dart';
import 'package:meal_app/widgets/mainDrawer.dart';

class FavouriteMealScreen extends StatefulWidget {

  final Function setFilteredData;
  final Map<String,bool> filters;
  FavouriteMealScreen(this.filters,this.setFilteredData);
  static const FavouriteMealRoute="/favouriteMeal";

  @override
  _FavouriteMealScreenState createState() => _FavouriteMealScreenState();
}

class _FavouriteMealScreenState extends State<FavouriteMealScreen> {

  bool isGlutenFree=false;
  bool isLactoseFree=false;
  bool isVegan=false;
  bool isVegetarian=false;
  @override 
 initState()
 {
   isGlutenFree=widget.filters['gluten'];
   isVegetarian=widget.filters['vegetarian'];
   isVegan=widget.filters['vegan'];
   isLactoseFree=widget.filters['lactose'];
   super.initState();
 }
  Widget switchButton(String title,String descrition,bool ckheckValue,Function updateValue)
  {
return ( 
  SwitchListTile(
                  value:ckheckValue,
                  title: Text(title),
                  subtitle: Text(descrition),
                  onChanged: updateValue,
                 ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Favourite Meal"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
          onPressed: (){
            final selectedFilters={
                       'gluten': isGlutenFree,
                      'lactose': isLactoseFree,
                      'vegan': isVegan,
                      'vegetarian': isVegetarian,
            };
             widget.setFilteredData(selectedFilters);          
          },)
        ],
      ),
      drawer: MainDrawer(),
      body:Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              alignment:Alignment.center,
              child: Text("Adjust Your Food Here",style: Theme.of(context).textTheme.title,),
            ),
            Expanded(
                child:ListView(
               children: <Widget>[
                switchButton('Gluten-Free','Only Gluten Free Meal', isGlutenFree,
                (newValue)
                {
                  setState(() {
                  isGlutenFree=newValue;
                  });
                }),
                switchButton('Lactose-Free','Only Lactose Free Meal', isLactoseFree,
                (newValue)
                {
                  setState(() {
                    isLactoseFree=newValue;
                  });
                }),
                switchButton('Vegan-Free','Only Vegan Free Meal', isVegan,
                (newValue)
                {
                  setState(() {
                    isVegan=newValue;
                  });
                }),
                switchButton('Vegeterian','Only Vegeterian Meal', isVegetarian,
                (newValue)
                {
                  isVegetarian=newValue;
                }),
               ],
                ),
            ),
          ],
      )
    );
  }
}