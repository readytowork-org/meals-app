import 'package:flutter/material.dart';

class MealRecipe extends StatelessWidget {
  static const routeName ="/recipe-detail";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
