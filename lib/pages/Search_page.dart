import 'package:flutter/material.dart';

import '../widgets/wallpapers.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //     elevation: 0, backgroundColor: Colors.white, title: CustomAppBar()),
        body: SafeArea(
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:15,top: 20 ),
                child: Text('Find Your \nWallpapers', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(66, 192, 192, 192),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Wallpapers",
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                      
                          },
                          child: const Icon(Icons.search)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 500,
                child:  GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 250),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return const WallpapersBlock();
          }),
              ),
            ],
          ),
        ),);
  }
}
