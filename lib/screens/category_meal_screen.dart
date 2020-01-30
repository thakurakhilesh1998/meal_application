import 'package:flutter/material.dart';
import 'package:meal_app/modal/meal.dart';
import 'package:meal_app/widgets/category_meal_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const MEALSCREEN="/categoryScreen";
  final List<Meal> categoryMeals;
  // final categoryId;
  // final categoryTitle;
  // CategoryMealScreen(this.categoryId,this.categoryTitle);
  CategoryMealScreen(this.categoryMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
  final args=ModalRoute.of(context).settings.arguments as Map<String,String>;
  final categoryId=args['id'];
  final categoryTitle=args['title'];
  final categoryMeal=widget.categoryMeals.where((meal)
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