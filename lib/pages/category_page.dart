import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:wallpapper_app/provider/theme_provider.dart';
import 'package:wallpapper_app/screens/catview_screen.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<String> categories = [];
  late List<String> categoryImages = [];

  @override
  void initState() {
    super.initState();
    // Retrieve data from Firestore
    FirebaseFirestore.instance.collection('walls').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var category = doc.data()['tags'];
        if (!categories.contains(category)) {
          categories.add(category);
          categoryImages.add(doc.data()['imageUrl']);
        }
      });
      setState(() {}); // Update the UI after data retrieval
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkModeEnabled = themeProvider.isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
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
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CatViewScreen(category: categories.elementAt(index)),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        categoryImages.elementAt(index),
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                categories.elementAt(index).toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.combine([
                    TextDecoration.underline,
                    TextDecoration.overline,
                  ]),
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
