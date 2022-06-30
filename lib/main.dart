import 'package:flutter/material.dart';
import './screens/filter_screen.dart';
import './screens/meal_recipe_screen.dart';
import './screens/tab_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // set initial route here. Default set to '/'
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealRecipe.routeName: (ctx) => MealRecipe(),
        FilteredScreen.routeName: (ctx) => FilteredScreen()
      },
      /** generate route name dynamically */
      // onGenerateRoute: (settings){
      //   // print(settings.arguments);
      //   // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      //   // if (settings.name == 'route-name') {
      //   //     return ...
      //   // }else if{
      //   //   return ...
      //   // }
      //    or switch statement
      // },

      /**It is reached when all other are unreachable */
      // onUnknownRoute: (settings){
      // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}

