import 'package:flutter/material.dart';

class CategoryRecipeScreen extends StatelessWidget {
  // final String? id;
  // final String? title;

  // CategoryRecipeScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          final id = routeArgs['id'];
    final title = routeArgs['title'];
  
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const Center(
        child: Text('Recipe goes here'),
      ),
    );
  }
}
