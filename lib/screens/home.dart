import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpapper_app/pages/category_page.dart';
import 'package:wallpapper_app/pages/favorite_page.dart';
import 'package:wallpapper_app/pages/wallpaper_page.dart';
import 'package:wallpapper_app/provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PersistentTabController(initialIndex: 1);
  List<Widget> _buildScreen() {
    return [
      const WallpaperPage(),
      const CategoryPage(),
      // const SearchPage(),
      const FavoritePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: themeProvider.isDarkMode
            ? Colors.purpleAccent
            : const Color.fromRGBO(100, 198, 248, 1),
        inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
        // textStyle: const TextStyle(fontSize: 17),
        icon: const Icon(
          Icons.wallpaper,
        ),
        title: 'All Images',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: themeProvider.isDarkMode
            ? Colors.purpleAccent
            : const Color.fromRGBO(100, 198, 248, 1),
        inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
        // textStyle: const TextStyle(fontSize: 17),
        icon: const Icon(
          Icons.home,
        ),
        title: 'Home',
      ),
      // PersistentBottomNavBarItem(
      //   activeColorPrimary: const Color.fromRGBO(100, 198, 248, 1),
      //   inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
      //   // textStyle: const TextStyle(fontSize: 17),
      //   icon: const Icon(
      //     Icons.search,
      //     // Icons.card_giftcard_outlined,
      //   ),
      //   title: 'Search',
      // ),
      PersistentBottomNavBarItem(
        activeColorPrimary: themeProvider.isDarkMode
            ? Colors.purpleAccent
            : const Color.fromRGBO(100, 198, 248, 1),
        inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
        // textStyle: const TextStyle(fontSize: 13),
        icon: const Icon(
          Icons.favorite,
        ),
        title: 'Favorite',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersistentTabView(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        controller: controller,
        context,
        screens: _buildScreen(),
        items: _navBarItem(),
        // backgroundColor: const Color.fromRGBO(47, 47, 46, 1),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
