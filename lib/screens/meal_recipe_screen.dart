import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealRecipe extends StatelessWidget {
  static const routeName = "/recipe-detail";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((item) => item.id == id);

    Widget _buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget _buildSectionContent(BuildContext context, Widget list) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: list,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title.toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, "Ingredients"),
              _buildSectionContent(
                  context,
                  ListView.builder(
                    itemBuilder: ((context, index) {
                      return Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(selectedMeal.ingredients![index]),
                      );
                    }),
                    itemCount: selectedMeal.ingredients!.length,
                  )),
              _buildSectionTitle(context, "Steps"),
              _buildSectionContent(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps![index]),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps!.length,
                ),
              )
            ],
          ),
        ));
  }
}
