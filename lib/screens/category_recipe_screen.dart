import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import "../data/dummy_data.dart";

class CategoryRecipeScreen extends StatelessWidget {
  static const routeName = "/category-recipe";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              imageUrl: categoryMeals[index].imageUrl);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
