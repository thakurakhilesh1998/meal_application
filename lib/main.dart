import 'package:flutter/material.dart';
import './screens/category_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detaits_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254,229,1),
        fontFamily: 'Relway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51,1)
          ),
           body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51,1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontWeight:FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          ),
        )

      ),
      home: Category(),
      routes: {
        CategoryMealScreen.MEALSCREEN:(ctx) => CategoryMealScreen(),
        MealDetails.MealDetailsRoute:(ctx)=>MealDetails(),
        
      },
      //this function calls when there is no any page to show by the flutter .
    onUnknownRoute: (settings)
    {
      MaterialPageRoute(builder: (ctx)=>Category());
    },
    );
  }
}
