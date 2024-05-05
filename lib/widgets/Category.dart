// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:wallpapper_app/screens/catview_screen.dart';

// class CategoryBlock extends StatelessWidget {
//   const CategoryBlock({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>  const CatViewScreen(),
//             ));
//       },
//       child: Container(
//         alignment: Alignment.center,
//         margin: const EdgeInsets.all(5.0),
//         decoration: BoxDecoration(
//             image: const DecorationImage(
//                 image: NetworkImage(
//                   'https://images.pexels.com/photos/3786092/pexels-photo-3786092.jpeg?auto=compress&cs=tinysrgb&w=600',
//                 ),
//                 fit: BoxFit.cover),
//             borderRadius: BorderRadius.circular(50)),
//         child: Text(
//           'Cars',
//           style: TextStyle(
//               decoration: TextDecoration.combine([
//                 TextDecoration.underline,
//                 TextDecoration.overline,
//               ]),
//               fontSize: 30,
//               color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
