import 'package:flutter/material.dart';
import 'package:lab36/data/meals_data.dart';
import 'package:lab36/models/destination.dart';
import 'package:lab36/models/meal.dart';
import 'package:lab36/screens/main_screen.dart';
import 'package:lab36/screens/settings_screen.dart';
import 'package:lab36/widgets/meal_add.dart';

import 'screens/history_screen.dart';

class Lab36 extends StatefulWidget {
  const Lab36({super.key});

  @override
  State<Lab36> createState() => _Lab36State();
}

class _Lab36State extends State<Lab36> {
  int currentScreenIndex = 0;
  double calories = 2000;
  List<Meal> meals = [];
  void updateIndex(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final loadedMeals = await loadMeals();
    setState(() {
      meals = loadedMeals;
    });
  }

  void addMeal(Meal newMeal) {
    setState(() {
      meals.add(newMeal);
    });
    saveMeal(meals);
  }

  void deleteMeal(String id) {
    setState(() {
      meals.removeWhere((meal) => meal.id == id);
    });
    saveMeal(meals);
  }

  void openMealBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => MealAdd(addMeal: addMeal),
    );
  }

  List<Destination> get destinations {
    return [
      Destination(
        screenTitle: Text('Home '),
        screen: MainScreen(meals: meals),
        navLabel: "Home",
        navIcon: Icons.home_outlined,
        navSelectedIcon: Icons.home,
        appBarActions: [
          IconButton(onPressed: openMealBottomSheet, icon: Icon(Icons.add)),
        ],
      ),
      Destination(
        screenTitle: Text('History '),
        screen: HistoryScreen(meals: meals, onMealDelete: deleteMeal),
        navLabel: "Story ",
        navIcon: Icons.history_outlined,
        navSelectedIcon: Icons.history,
        appBarActions: [
          IconButton(onPressed: openMealBottomSheet, icon: Icon(Icons.add)),
        ],
      ),
      Destination(
        screenTitle: Text('Settings '),
        screen: SettingsScreen(calories: calories),
        navLabel: "Setting ",
        navIcon: Icons.settings_outlined,
        navSelectedIcon: Icons.settings,
        appBarActions: [
          IconButton(onPressed: openMealBottomSheet, icon: Icon(Icons.add)),
        ],
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
