import 'package:flutter/material.dart';
import 'package:meal_app/modal/meal.dart';
import '../screens/meal_detaits_screen.dart';
class CategoryMealData extends StatelessWidget {
  final String id;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String imageUrl;
  CategoryMealData({
      @required this.id,
      @required this.title,
      @required this.complexity,
      @required this.affordability,
      @required this.duration,
      @required this.imageUrl
                    });

  String get affordabilityData
  {
      switch(affordability)
      {
        case Affordability.Affordable:
        return "Affordable";
        break;
        case Affordability.Luxurious:
        return "Luxurious";
        break;
        case Affordability.Pricey:
        return "Pricesy";
        default:
        return "Unknown";
      }
  }
  String get complexityData
  {
      switch(complexity)
      {
        case Complexity.Simple:
        return "Simple";
        break;
        case Complexity.Hard:
        return "Hard";
        break;
        case Complexity.Challenging:
        return "Challenging";
        break;
        default:
        return "Unknown";
      }
  }
void onSelected(BuildContext context)
{
Navigator.of(context).pushNamed(MealDetails.MealDetailsRoute,
arguments: id);
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => onSelected(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26,color: Colors.white),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        ),
                    ),
                    ),
                ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              
                children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.watch_later,
                  color: Colors.green,),
                  SizedBox(width: 6),
                  Text('$duration min',style: TextStyle(color: Colors.black),),
                ],
                ),
                Row(children: <Widget>[
                  Icon(Icons.work,
                  color: Colors.green,),
                  SizedBox(width: 6),
                  Text(complexityData,style: TextStyle(color: Colors.black)),
                ],
                ),
                Row(children: <Widget>[
                  Icon(Icons.attach_money,
                  color: Colors.green,
                  ),
                  SizedBox(width: 6),
                  Text(affordabilityData,style: TextStyle(color: Colors.black)),
                ],
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}