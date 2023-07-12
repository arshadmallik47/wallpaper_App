import 'package:flutter/material.dart';

class WallpapersBlock extends StatelessWidget {
  const WallpapersBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                'https://images.pexels.com/photos/5083405/pexels-photo-5083405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    
    );
  }
}
