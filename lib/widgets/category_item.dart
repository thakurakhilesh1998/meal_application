import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';
class  CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id,this.title,this.color);
  void onSelected(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.MEALSCREEN,arguments: {
      'id':id,'title':title
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onSelected(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
        child: Text(title,style: Theme.of(context).textTheme.title,),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(gradient: LinearGradient(
        colors: [color.withOpacity(0.6),color],
        begin:Alignment.topLeft,
        end: Alignment.bottomRight),
        borderRadius:BorderRadius.circular(10)
        ),
      ),
    );
  }
}