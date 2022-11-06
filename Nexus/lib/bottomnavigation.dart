import 'package:flutter/material.dart';
import 'package:nexus/Screens/home.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      //BitcoinScreen(),
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: NavigationBar(
            height: 60,
            backgroundColor: Theme.of(context).colorScheme.background,
            animationDuration: Duration(seconds: 1),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,),
                  selectedIcon: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.search_rounded,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  selectedIcon: Icon(Icons.search_rounded,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  label: 'Analysis'),
              NavigationDestination(
                  icon: Icon(Icons.add_rounded,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  selectedIcon: Icon(
                      Icons.add_rounded,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  label: 'Post'),
            ]
        ),
      ),
    );
  }
}
