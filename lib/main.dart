import 'package:flutter/material.dart';
import 'package:meal_app/dummy-data.dart';
import 'package:meal_app/modal/meal.dart';
import 'package:meal_app/screens/TabBarScreen.dart';
import 'package:meal_app/screens/favourite_meal_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detaits_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map<String, bool> filteredList = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
   List<Meal> categoryMeals=DUMMY_MEALS;
   List<Meal> favouriteList=[];
   void toggleFavourite(String id)
   {
     final existingIndex=favouriteList.indexWhere((text)
     {
        return text.id==id;
     });
     if(existingIndex>0)
     {
       setState(() {
        favouriteList.removeAt(existingIndex);

       });
     }
     else
     {
       setState(() {
       favouriteList.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == id),
        );
       });
     }
   }
   bool isFavourite(String id)
   {
     return favouriteList.any((test)
     {
       return test.id==id;
     });
   }
   void _setFilteredData(Map<String,bool> filteredData)
   {
    setState(() {      
      filteredList=filteredData;
      categoryMeals=DUMMY_MEALS.where( (filter) 
      {  
       if((filteredList['vegan']) && !filter.isVegan)
       {
         return false;
       }
        if((filteredList['gluten']) && !filter.isGlutenFree)
       {
         return false;
       }
        if((filteredList['lactose']) && !filter.isLactoseFree)
       {
         return false;
       }
        if((filteredList['vegetarian']) && !filter.isVegetarian)
       {
         return false;
       }
       return true;
      },
      ).toList();
    });
   }


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
      routes: {
        '/':(ctx) => TabBarScreen(favouriteList), 
        CategoryMealScreen.MEALSCREEN:(ctx) => CategoryMealScreen(categoryMeals),
        MealDetails.MealDetailsRoute:(ctx)=>MealDetails(toggleFavourite,isFavourite),
        FavouriteMealScreen.FavouriteMealRoute:(ctx) =>FavouriteMealScreen(filteredList,_setFilteredData),
 
      },
      //this function calls when there is no any page to show by the flutter .
    // onUnknownRoute: (settings)
    // {
    //   MaterialPageRoute(builder: (ctx)=>Category());
    // },
    );
  }
}
