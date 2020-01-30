import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../widgets/category_item.dart';
class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),

      children:DUMMY_CATEGORIES.map((cat)
      {
        return CategoryItem(cat.id,
        cat.title,
        cat.color);
      }).toList(),
      gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20),
      );
  
}
}