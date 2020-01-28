import 'package:flutter/material.dart';
import 'package:meal_app/dummy-data.dart';

class MealDetails extends StatelessWidget {
  static const MealDetailsRoute='/Meal-DetailsRoute';
 Widget conayinerTitle(BuildContext context,String title)
 {
      return (Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:Text(title,style: Theme.of(context).textTheme.title),
          ));

 }
  Widget listDataBuilder(Widget child)
              {
        return( Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              height: 200,
              width: 250,
              decoration:BoxDecoration(
                border: Border.all(width: 1,
                color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ) ,
              child:child,
            ));
 }
  @override
  Widget build(BuildContext context) {
     final mealId=ModalRoute.of(context).settings.arguments;
     final mealDetails=DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Details"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(mealDetails.imageUrl,
              fit: BoxFit.cover,),
            ),
              conayinerTitle(context,'Ingredients'),
            listDataBuilder(
                  ListView.builder(
                  itemBuilder: (ctx,index)
                  {
                    return Card(
                      color:Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                          child: Text(mealDetails.ingredients[index],style: TextStyle(fontSize: 16),
                          ),            
                      ),
                    );
                  },
                  itemCount: mealDetails.ingredients.length,
                ),
            ),
              conayinerTitle(context, 'Steps'),
              listDataBuilder(
                ListView.builder(
                  itemBuilder: (ctx,index)
                  {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text('# ${index+1}'),
                    ),
                    title: Card
                    (
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(mealDetails.steps[index]),
                      )),
                  );
                  },
                  itemCount:mealDetails.steps.length,
                )
              ),
          ],
        ),
      )
    );
  }
}