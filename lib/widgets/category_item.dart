import 'package:flutter/material.dart';
import '../screens/category_recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CategoryItem(this.id, this.title, this.color);

  void showRecipe(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryRecipeScreen.routeName, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showRecipe(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color!.withOpacity(0.7),
              color!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
