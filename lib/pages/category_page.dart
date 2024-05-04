// import 'package:flutter/material.dart';
// import 'package:wallpapper_app/widgets/Category.dart';

// class CategoryPage extends StatefulWidget {
//  // final AsyncSnapshot snapshot;
//   const CategoryPage({super.key,});

//   @override
//   State<CategoryPage> createState() => _CategoryPageState();
// }

// class _CategoryPageState extends State<CategoryPage> {
// final categories=List<String>;
// final categoryImages=List<String>;

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Category'),
//         ),
//         body: GridView.builder(

//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

//               crossAxisCount:2,

//             ),
//             itemCount: 30,
//             itemBuilder: (BuildContext context, int index) {

//             })
//         // body: ListView.builder(

//         //     itemCount: 30,
//         //     itemBuilder: (contex, index) =>const CategoryBlock(),

//         //     ),
//         );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
              categories.elementAt(index),
              style: TextStyle(
                  decoration: TextDecoration.combine([
                    TextDecoration.underline,
                    TextDecoration.overline,
                  ]),
                  fontSize: 30,
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
