import 'package:flutter/material.dart';
import './category_recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

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
