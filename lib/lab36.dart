import 'package:flutter/material.dart';
import 'package:lab36/models/destination.dart';
import 'package:lab36/screens/main_screen.dart';
import 'package:lab36/screens/settings_screen.dart';

import 'screens/history_screen.dart';

class Lab36 extends StatefulWidget {
  const Lab36({super.key});

  @override
  State<Lab36> createState() => _Lab36State();
}

class _Lab36State extends State<Lab36> {
  int currentScreenIndex = 0;

  void updateIndex(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  List<Destination> get destinations {
    return [
      Destination(
        screenTitle: Text('Home '),
        screen: MainScreen(),
        navLabel: "Home",
        navIcon: Icons.home_outlined,
        navSelectedIcon: Icons.home,
        appBarActions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      Destination(
        screenTitle: Text('History '),
        screen: HistoryScreen(),
        navLabel: "Story ",
        navIcon: Icons.history_outlined,
        navSelectedIcon: Icons.history,
        appBarActions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      Destination(
        screenTitle: Text('Settings '),
        screen: SettingsScreen(),
        navLabel: "Setting ",
        navIcon: Icons.settings_outlined,
        navSelectedIcon: Icons.settings,
        appBarActions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final destination = destinations[currentScreenIndex];
    return Scaffold(
      appBar: AppBar(
        title: destination.screenTitle,
        actions: destination.appBarActions,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreenIndex,
        onDestinationSelected: updateIndex,
        destinations:
            destinations
                .map(
                  (destination) => NavigationDestination(
                    icon: Icon(destination.navIcon),
                    selectedIcon: Icon(destination.navSelectedIcon),
                    label: destination.navLabel,
                  ),
                )
                .toList(),
      ),
      body: destination.screen,
    );
  }
}
