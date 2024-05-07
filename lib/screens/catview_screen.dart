// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpapper_app/utils/utils.dart';

class CatViewScreen extends StatefulWidget {
  final String category;
  const CatViewScreen({super.key, required this.category});

  @override
  State<CatViewScreen> createState() => _CatViewScreenState();
}

class _CatViewScreenState extends State<CatViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.category.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('walls').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching cards'));
          }
          if (snapshot.hasData) {
            var catDocuments = snapshot.data!.docs.where((element) {
              var data = element.data() as Map<String, dynamic>?;
              // Adding a null check before accessing the map
              return data != null && data['tags'] == widget.category;
            });

            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      crossAxisCount: 1,
                      mainAxisExtent: 250),
                  itemCount: catDocuments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await setWallpapers(
                          context: context,
                          url: catDocuments.elementAt(index)['imageUrl'],
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                catDocuments.elementAt(index)['imageUrl'],
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  }),
            );
            //      ),
          }
          return Container();
        },
      ),
    );
  }
}
