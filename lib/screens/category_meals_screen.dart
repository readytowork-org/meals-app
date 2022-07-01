// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import "../models/meal.dart";

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-recipe";

  final List<Meal> _availableMeals;

  CategoryMealScreen(this._availableMeals, {Key? key}) : super(key: key);
  
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //runs when the widget that it belongs to state has been fully initialized an get context data
  @override
  void didChangeDependencies() {
    //if check not needed in latest flutter version
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final id = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget._availableMeals.where((meal) {
        return meal.categories!.contains(id);
      }).toList();
      _loadedInitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      displayedMeals.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            imageUrl: displayedMeals[index].imageUrl,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
