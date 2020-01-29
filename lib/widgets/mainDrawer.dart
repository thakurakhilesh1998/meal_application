import 'package:flutter/material.dart';
import 'package:meal_app/screens/favourite_meal_screen.dart';
import '../screens/category_meal_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget listTile(BuildContext context,String title,IconData data,Function onListSelected)
  {
       return ListTile(
        leading:Icon(data,size: 16,),
        title:Text(title,style: 
        TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 26,fontWeight: FontWeight.bold),
        ),
        onTap:onListSelected ,
        );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              child: Text("Cooking Up!",
              style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700,fontSize: 30),
              ),
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              width: 10,
            ),
            listTile(context,"Meals",Icons.restaurant,
            ()
            {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            Divider(
               height: 2,
            ),
            listTile(context,"Filter",Icons.settings,
            ()
            {
              Navigator.of(context).pushReplacementNamed(FavouriteMealScreen.FavouriteMealRoute);
            }),
          ],
        ),
    );
  }
}