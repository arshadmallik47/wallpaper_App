import 'package:flutter/material.dart';
import 'package:wallpapper_app/widgets/CustomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomAppBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(66, 192, 192, 192),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  )),
              // child: Row(
              //   children: [
              //     const Expanded(
              //       child: TextField(
              //         decoration: InputDecoration(
              //           hintText: "Search Wallpapers",
              //           errorBorder: InputBorder.none,
              //           focusedBorder: InputBorder.none,
              //           focusedErrorBorder: InputBorder.none,
              //           disabledBorder: InputBorder.none,
              //           enabledBorder: InputBorder.none,
              //           border: InputBorder.none,
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //         onTap: () {
              //           print('Searching.......');
              //         },
              //         child: const Icon(Icons.search)),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
