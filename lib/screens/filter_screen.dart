import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilteredScreen extends StatefulWidget {
  static const routeName = "/filtered-screen";
  Function filterdata;

  FilteredScreen(this.filterdata, {Key? key}) : super(key: key);

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _islactoseFree = false;
  var _isVegiterian = false;

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (value) {
        updateValue(value);
      },
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filtered Meals"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                final filter = {
                  "isGlutenFree" : _isGlutenFree,
                  "isVegan" : _isVegan,
                  "islactoseFree" : _islactoseFree,
                  "isVegiterian" : _isVegiterian,
                };
                widget.filterdata(filter);
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal settings",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchTile(
                      "Gluten Free",
                      "Only include gluten free meals",
                      _isGlutenFree, (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  }),
                  _buildSwitchTile(
                      "Vegan", "Only include vegan meals", _isVegan,
                      (newValue) {
                    setState(
                      () {
                        _isVegan = newValue;
                      },
                    );
                  }),
                  _buildSwitchTile(
                      "Lactose Free",
                      "Only include lactose free meals",
                      _islactoseFree, (newValue) {
                    setState(
                      () {
                        _islactoseFree = newValue;
                      },
                    );
                  }),
                  _buildSwitchTile(
                      "Vegiterian",
                      "Only include vegeterian meals",
                      _isVegiterian, (newValue) {
                    setState(
                      () {
                        _isVegiterian = newValue;
                      },
                    );
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
