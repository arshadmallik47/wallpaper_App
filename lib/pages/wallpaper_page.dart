import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapper_app/models/wallpaper_model.dart';
import 'package:wallpapper_app/pages/wallpaper_gallery.dart';
import 'package:wallpapper_app/provider/theme_provider.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkModeEnabled = themeProvider.isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallpapers',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.setDarkMode(!isDarkModeEnabled);
            },
            icon: Icon(themeProvider.isDarkMode
                ? Icons.brightness_5
                : Icons.brightness_5_outlined),
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('walls')
              .snapshots(), // Adjust the query as needed
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching cards'));
            } else {
              var wallpaperList = List<WallpaperModel>() = [];
              snapshot.data!.docs.forEach((documentsnapshot) {
                wallpaperList
                    .add(WallpaperModel.fromDocumentSnapshot(documentsnapshot));
              });
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      crossAxisCount: 3,
                      mainAxisExtent: 180,
                      mainAxisSpacing: 5),
                  itemCount: wallpaperList.length,
                  itemBuilder: (BuildContext context, int index) {
                    //print(wallpaperList.elementAt(index).name);
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WallpaperGallery(
                                    initialIndex: index,
                                    wallpaperList: wallpaperList),
                              ),
                            );
                            // go to wallpaper gallery mode
                          },
                          child: CachedNetworkImage(
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            imageUrl: wallpaperList.elementAt(index).url,
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
