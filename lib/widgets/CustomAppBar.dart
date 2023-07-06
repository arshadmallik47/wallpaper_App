import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: 'Wallpaper',style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w600),
          children: [
          
            TextSpan(text: ' Live',style: TextStyle(color: Colors.orangeAccent,fontSize: 20,fontWeight: FontWeight.w600))
          ],
          
        ),
        
      ),
    );
  }
}
