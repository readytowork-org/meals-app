import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {

  final String? title;
   final String? imageUrl;
  final  int? duration;
 final Complexity? complexity;
 final Affordability? affordability;


 MealItem({Key? key,  @required this.title,@required this.duration,@required this.complexity, @required this.affordability, @required this.imageUrl}) : super(key: key)

  // ignore: empty_constructor_bodies
  void showRecipe(){
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showRecipe,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Image.network(imageUrl.toString(), height: 250, width: double.infinity, fit:BoxFit.contain,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
