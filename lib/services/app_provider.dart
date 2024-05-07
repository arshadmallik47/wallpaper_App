import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wallpapper_app/provider/theme_provider.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: child,
      );
}
