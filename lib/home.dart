import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

import 'package:fooderlich_app/screens/explore_screen.dart';
import 'package:fooderlich_app/screens/grocery_screen.dart';
import 'package:fooderlich_app/screens/recipes_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen()
  ];
  
@override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title:
              Text('Fooderlich', style: Theme.of(context).textTheme.headline6),
        ),
        body: pages[tabManager.selectedtab],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedtab,
            onTap: (index) {
              tabManager.goTotab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy'),
            ]
            ),
      );
    });
  }
}
