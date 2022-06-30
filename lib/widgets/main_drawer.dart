import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildDrawer(String title, IconData icon, Function navigateTo) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: (){
        navigateTo();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Meals",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildDrawer(
            "Meals",
            Icons.restaurant,
            (){
              Navigator.of(context).pushNamed('/');
            },
          ),
          _buildDrawer(
            "Filtered Meals",
            Icons.settings,
            (){
              Navigator.of(context).pushNamed(FilteredScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
