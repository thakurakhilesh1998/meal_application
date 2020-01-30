import 'package:flutter/material.dart';
import 'package:meal_app/modal/meal.dart';
import '../widgets/category_meal_data.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteList;
  FavouriteScreen(this.favouriteList);
  
  @override
  Widget build(BuildContext context) {
    return 
    
    favouriteList.isEmpty ? Center(
      child: Text("No Favourite Meal Yet !"),
    ) : ListView.builder(itemBuilder: (ctx,index)
    {
      return CategoryMealData(
        id:favouriteList[index].id,
        title: favouriteList[index].title,
        imageUrl: favouriteList[index].imageUrl,
        duration:favouriteList[index].duration,
        affordability: favouriteList[index].affordability,
        complexity: favouriteList[index].complexity,);
    },
    itemCount:favouriteList.length,
    );
  }
}