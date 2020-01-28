import 'package:flutter/material.dart';
import 'package:meal_app/dummy-data.dart';
import 'package:meal_app/widgets/category_meal_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const MEALSCREEN="/categoryScreen";
  // final categoryId;
  // final categoryTitle;
  // CategoryMealScreen(this.categoryId,this.categoryTitle);
  
  @override
  Widget build(BuildContext context) {
  final args=ModalRoute.of(context).settings.arguments as Map<String,String>;
  final categoryId=args['id'];
  final categoryTitle=args['title'];
  final categoryMeal=DUMMY_MEALS.where((meal)
  {
    return meal.categories.contains(categoryId);
  }).toList();
    return Scaffold(
      appBar: AppBar(
      title: Text(categoryTitle),
      backgroundColor: Theme.of(context).primaryColor,

    ),
    body:ListView.builder(itemBuilder: (ctx,index)
    {
      return CategoryMealData(id:categoryMeal[index].id,title: categoryMeal[index].title,imageUrl: categoryMeal[index].imageUrl,
      duration:categoryMeal[index].duration,
      affordability: categoryMeal[index].affordability,complexity: categoryMeal[index].complexity,);
    },
    itemCount:categoryMeal.length,
    )
    );
     
  
  }
}