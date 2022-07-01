import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty)
    {
      return const Center(
        child: Text("You have no favourites yet - start adding some !"),
      );
    }else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            imageUrl: favouriteMeals[index].imageUrl,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
