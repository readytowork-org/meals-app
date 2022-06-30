import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilteredScreen extends StatelessWidget {
  const FilteredScreen({Key? key}) : super(key: key);
  static const routeName = "/filtered-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtered Meals"),
      ),
      drawer:  MainDrawer(),
      body: const Center(
        child: Text("Filtered Screen"),
      ),
    );
  }
}
