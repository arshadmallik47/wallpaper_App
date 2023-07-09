import 'package:flutter/material.dart';

import 'package:wallpapper_app/widgets/wallpapers.dart';

//import '../widgets/Category.dart';

class CatViewScreen extends StatelessWidget {
  const CatViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Wallpapers',
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
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  'https://images.pexels.com/photos/7079774/pexels-photo-7079774.jpeg?auto=compress&cs=tinysrgb&w=600'),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
              ),
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 70),
                      alignment: Alignment.center,
                      child: const Text(
                        'Mountains',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 440,
            child: GridView.builder(
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
      //),
    );
  }
}
