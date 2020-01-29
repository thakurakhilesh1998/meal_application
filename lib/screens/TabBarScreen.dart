import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/mainDrawer.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
 
 final List<Map<String, Object>> pages=[
      {  
          'title':'Category',
          'page':Category()
      },
      {   'title':'Favourite',
          'page':FavouriteScreen()
      }
    ];
  int selectedIndex=0;
  void _onSelected(int index)
  {
    setState(() {
      selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(pages[selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_onSelected,
        currentIndex: selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items:[
        BottomNavigationBarItem(
          icon:Icon(Icons.category),
          title: Text('Category'),
      ),
        BottomNavigationBarItem(
          icon:Icon(Icons.star),
          title: Text('Category'),
      ),],
    ),
    );
}
}