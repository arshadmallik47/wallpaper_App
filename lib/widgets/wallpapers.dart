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
                'https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    
    );
  }
}
