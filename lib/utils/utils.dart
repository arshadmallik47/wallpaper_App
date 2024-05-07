// ignore_for_file: camel_case_types, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_cropper/image_cropper.dart';

enum setWallpaperAs {
  Home,
  Lock,
  Both,
}

final _setAs = {
  setWallpaperAs.Home: WallpaperManager.HOME_SCREEN,
  setWallpaperAs.Lock: WallpaperManager.LOCK_SCREEN,
  setWallpaperAs.Both: WallpaperManager.BOTH_SCREEN,
};

Future<void> setWallpapers(
    {required BuildContext context, required String url}) async {
  setWallpaperAs option = await showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: const Text('Set as'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(setWallpaperAs.Home);
          },
          child: const Text('Home'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(setWallpaperAs.Lock);
          },
          child: const Text('Lock'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(setWallpaperAs.Both);
          },
          child: const Text('Both'),
        ),
      ],
    ),
  );
  if (option != null) {
    var cachedImage = await DefaultCacheManager().getSingleFile(url);
    if (cachedImage != null) {
      var croppedImage = await ImageCropper().cropImage(
        sourcePath: cachedImage.path,
        // aspectRatio: CropAspectRatio(
        //   ratioX: MediaQuery.of(context).size.width * 1,
        //   ratioY: MediaQuery.of(context).size.height * 1,
        // ),
        // uiSettings: [
        //   AndroidUiSettings(
        //     toolbarTitle: 'Image Cropper',
        //     toolbarColor: Colors.blue,
        //     hideBottomControls: true,
        //   ),
        // ]
      );

      if (croppedImage != null) {
        var result = await WallpaperManager.setWallpaperFromFile(
            cachedImage.path, _setAs[option]!);
        if (result != null) {
          print(result);
        }
      }
    }
  }
}
