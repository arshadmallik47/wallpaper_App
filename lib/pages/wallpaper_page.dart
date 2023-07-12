import 'package:flutter/material.dart';
import 'package:wallpapper_app/controller/apiOperation.dart';
import 'package:wallpapper_app/widgets/wallpapers.dart';

//import '../widgets/Category.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  @override
  void initState() {
    super.initState();
    ApiOperations.GetTrendingWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers'),
      ),
      body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 320),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return const WallpapersBlock();
          }),
      //),
    );
  }
}
