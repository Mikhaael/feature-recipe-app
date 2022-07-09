import 'package:flutter/material.dart';
import 'package:fooderlich_app/screens/explore_screen.dart';
import 'package:fooderlich_app/screens/grocery_screen.dart';
import 'package:fooderlich_app/screens/recipes_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: FooderlichPages.home,
      key: ValueKey(FooderlichPages.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  final int currentTab;

  const Home({Key? key, required this.currentTab}) : super(key: key);

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
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
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
                  Provider.of<AppStateManager>(context, listen: false)
                      .goToTab(index);
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
    });
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/profile_pics/mikhaeel.jpg'),
        ),
        onTap: () {
          Provider.of<ProfileManager>(context, listen: false)
              .tapOnProfile(true);
        },
      ),
    );
  }
}
