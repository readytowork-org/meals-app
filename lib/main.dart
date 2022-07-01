// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './models/meal.dart';
import './data/dummy_data.dart';
import './screens/filter_screen.dart';
import './screens/meal_recipe_screen.dart';
import './screens/tab_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "isGlutenFree": false,
    "isVegan": false,
    "islactoseFree": false,
    "isVegiterian": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void _saveFilter(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;
      print(filteredData);
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['isGlutenFree'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['isVegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['isLactoseFree'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['isVegiterian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeWhere((meal) => meal.id == mealId);
      });
    } else {
      setState(() {
        final selectedMeal =
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
        _favouriteMeals.add(selectedMeal);
      });
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // set initial route here. Default set to '/'
      routes: {
        '/': (ctx) => TabScreen(_favouriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealRecipe.routeName: (ctx) =>
            MealRecipe(_toggleFavourite, _isFavourite),
        FilteredScreen.routeName: (ctx) => FilteredScreen(_saveFilter)
      },
      /** generate route name dynamically */
      // onGenerateRoute: (settings){
      //   // print(settings.arguments);
      //   // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      //   // if (settings.name == 'route-name') {
      //   //     return ...
      //   // }else if{
      //   //   return ...
      //   // }
      //    or switch statement
      // },

      /**It is reached when all other are unreachable */
      // onUnknownRoute: (settings){
      // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}
