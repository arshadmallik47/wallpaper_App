import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:wallpapper_app/models/wallpaper_model.dart';
import 'package:wallpapper_app/provider/theme_provider.dart';
import 'package:wallpapper_app/utils/utils.dart';

class WallpaperGallery extends StatefulWidget {
  final List<WallpaperModel> wallpaperList;
  final int initialIndex; // Add initialIndex here
  WallpaperGallery(
      {super.key,
      required this.wallpaperList,
      required this.initialIndex}); // Receive initialIndex

  @override
  State<WallpaperGallery> createState() => _WallpaperGalleryState();
}

class _WallpaperGalleryState extends State<WallpaperGallery> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialIndex);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        PhotoViewGallery.builder(
          itemCount: widget.wallpaperList.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(
                  widget.wallpaperList.elementAt(index).url),
              initialScale:
                  PhotoViewComputedScale.contained, // Set initial scale
              minScale: PhotoViewComputedScale.contained *
                  0.8, // Adjust minScale as needed
              maxScale: PhotoViewComputedScale.covered *
                  2, // Adjust maxScale as needed
            );
          },
          // Set initial index
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          pageController: _pageController,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                setWallpapers(
                    context: context,
                    url: widget.wallpaperList
                        .elementAt(_pageController.page!.toInt())
                        .url);
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 150.0,
                child: Text(
                  'Set Wallpaper',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
