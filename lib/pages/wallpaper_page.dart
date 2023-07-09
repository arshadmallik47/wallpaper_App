import 'package:flutter/material.dart';
import 'package:wallpapper_app/widgets/wallpapers.dart';

//import '../widgets/Category.dart';

class WallpaperPage extends StatelessWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers'),
      ),
      body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 400),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return const WallpapersBlock();
          }),
      //),
    );
  }
}
