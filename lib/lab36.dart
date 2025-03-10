import 'package:flutter/material.dart';
import 'package:lab36/data/meals_data.dart';
import 'package:lab36/models/calorie_max.dart';
import 'package:lab36/models/destination.dart';
import 'package:lab36/models/meal.dart';
import 'package:lab36/screens/main_screen.dart';
import 'package:lab36/screens/settings_screen.dart';
import 'package:lab36/theme/colors.dart';
import 'package:lab36/widgets/meal_add.dart';

import 'data/calorie_data.dart';
import 'screens/history_screen.dart';

class Lab36 extends StatefulWidget {
  const Lab36({super.key});

  @override
  State<Lab36> createState() => _Lab36State();
}

class _Lab36State extends State<Lab36> {
  int currentScreenIndex = 0;
  CalorieMax? calories;
  List<Meal> meals = [];

  void updateIndex(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  void updateCalories(CalorieMax newCalories) {
    setState(() {
      calories = newCalories;
    });
    saveCalorie(calories!);
  }

  @override
  void initState() {
    super.initState();
    loadData();
    loadCalories();
  }

  void loadData() async {
    final loadedMeals = await loadMeals();
    setState(() {
      meals = loadedMeals;
    });
  }

  void loadCalories() async {
    final loadedCalories = await loadCalorie();
    setState(() {
      calories = loadedCalories;
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
    final customColor = Theme.of(context).extension<CustomColor>()!;
    return [
      Destination(
        screenTitle: Text('Home '),
        screen: MainScreen(
          meals: meals,
          calorie: calories ?? CalorieMax(calories: 2000),
        ),
        navLabel: "Home",
        navIcon: Icons.home_outlined,
        navSelectedIcon: Icons.home,
        appBarActions: [
          IconButton(
            onPressed: openMealBottomSheet,
            icon: Icon(
              Icons.add,
              size: 40,
              color: customColor.bottomNavBarSelectedColor,
            ),
          ),
        ],
      ),
      Destination(
        screenTitle: Text('History '),
        screen: HistoryScreen(meals: meals, onMealDelete: deleteMeal),
        navLabel: "Story ",
        navIcon: Icons.history_outlined,
        navSelectedIcon: Icons.history,
        appBarActions: [
          IconButton(
            onPressed: openMealBottomSheet,
            icon: Icon(
              Icons.add,
              size: 40,
              color: customColor.bottomNavBarSelectedColor,
            ),
          ),
        ],
      ),
      Destination(
        screenTitle: Text('Settings '),
        screen: SettingsScreen(
          calories: calories ?? CalorieMax(calories: 2000),
          updateCalories: updateCalories,
        ),
        navLabel: "Setting ",
        navIcon: Icons.settings_outlined,
        navSelectedIcon: Icons.settings,
        appBarActions: [
          IconButton(
            onPressed: openMealBottomSheet,
            icon: Icon(
              Icons.add,
              size: 40,
              color: customColor.bottomNavBarSelectedColor,
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final destination = destinations[currentScreenIndex];
    final customColor = Theme.of(context).extension<CustomColor>()!;
    return Scaffold(
      appBar: AppBar(
        title: destination.screenTitle,
        actions: destination.appBarActions,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreenIndex,
        indicatorColor: customColor.bottomNavBarSelectedColor,
        onDestinationSelected: updateIndex,
        destinations:
            destinations
                .map(
                  (destination) => NavigationDestination(
                    icon: Icon(
                      destination.navIcon,
                      size: 30,
                      color: customColor.bottomNavBarSelectedColor,
                    ),
                    selectedIcon: Icon(
                      destination.navSelectedIcon,
                      size: 25,
                      color: customColor.iconColor,
                    ),
                    label: destination.navLabel,
                  ),
                )
                .toList(),
      ),
      body: destination.screen,
    );
  }
}
