import 'package:flutter/material.dart';

class CategoryRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Page'),
      ),
      body: const Center(
        child: Text('Recipe goes here'),
      ),
    );
  }
}
