import 'package:flutter/material.dart';
import 'package:fooderlich_app/screens/explore_screen.dart';
import 'package:fooderlich_app/screens/grocery_screen.dart';
import 'package:fooderlich_app/screens/recipes_screen.dart';

class Home extends StatefulWidget {
  // TODO: Home MaterialPage Helper
  final int currentTab;

  const Home({
    Key? key,
    required this.currentTab
    }) : super(key: key);


    
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen()
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: Wrap Consumer for AppStateManager
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          profileButton(),
        ],
      ),
      
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: widget.currentTab,
            onDestinationSelected: (index) {
              setState(() {
                // _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: Text('Explore'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Recipes'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list_outlined),
                selectedIcon: Icon(Icons.list),
                label: Text('List'),
              ),
            ],
            useIndicator: true,
            backgroundColor: Colors.grey[50],
            indicatorColor: Colors.cyan[50],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
        ],
      ),
    );
    // TODO: Add closing },);
  }

  Widget profileButton()  {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0
      ),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/mikhaeel.jpg'
          ),
        ),
        onTap: () {
          // TODO: home -> profile
        },
      ),
    );
  }
}


 IndexedStack(
        index: widget.currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: widget.currentTab,
        onTap: (index)  {
          // TODO: Update user's selected tab
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy'
          ),
        ],
      ),