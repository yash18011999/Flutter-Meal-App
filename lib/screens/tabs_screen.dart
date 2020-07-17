import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favourites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> pages;

  int selectedPageIndex = 0;
  @override
  void initState() {
    pages =[
      {'pages': CategoryScreen(), 'title': 'Categories'},
      {'pages': FavouritesScreen(widget.favouriteMeals), 'title': 'Your Favourites'}
    ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: selectedPageIndex,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.favorite),
                title: Text('Favourites')),
          ]),
    );
  }
}
