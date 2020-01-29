import 'package:flutter/material.dart';
import 'package:meal_app/widgets/mainDrawer.dart';

class FavouriteMealScreen extends StatefulWidget {

  static const FavouriteMealRoute="/favouriteMeal";

  @override
  _FavouriteMealScreenState createState() => _FavouriteMealScreenState();
}

class _FavouriteMealScreenState extends State<FavouriteMealScreen> {

  var isGlutenFree=false;
  var isLactoseFree=false;
  var isVegan=false;
  var isVegetarian=false;
  Widget switchButton(String title,String descrition,bool ckheckValue)
  {
return ( 
  SwitchListTile(
                  value:ckheckValue,
                  title: Text(title),
                  subtitle: Text(descrition),
                  onChanged: (value)
                  {
                    setState(() {
                      ckheckValue=value;
                    });
                  },
                 ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Favourite Colour"),
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
                switchButton('Gluten-Free','Only Gluten Free Meal', isGlutenFree),
                switchButton('Lactose-Free','Only Lactose Free Meal', isLactoseFree),
                switchButton('Vegan-Free','Only Vegan Free Meal', isVegan),
                switchButton('Vegeterian','Only Vegeterian Meal', isVegetarian),
               ],
                ),
            ),
          ],
      )
    );
  }
}