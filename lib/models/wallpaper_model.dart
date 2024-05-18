// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';

class WallpaperModel {
  final String url;
  final String category;
  //final String name;

  WallpaperModel.fromDocumentSnapshot(DocumentSnapshot snapshot)
      : this.url = snapshot['imageUrl'],
        this.category = snapshot['tags'];
  // this.name = snapshot['name'];
}
