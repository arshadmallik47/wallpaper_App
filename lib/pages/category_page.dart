import 'package:flutter/material.dart';
import 'package:wallpapper_app/widgets/Category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: GridView.builder(
          physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount:2,
              
              
            ),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return const CategoryBlock();
            })
        // body: ListView.builder(

        //     itemCount: 30,
        //     itemBuilder: (contex, index) =>const CategoryBlock(),

        //     ),
        );
  }
}
