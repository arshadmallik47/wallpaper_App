import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wallpapper_app/pages/Search_page.dart';
import 'package:wallpapper_app/pages/category_page.dart';
import 'package:wallpapper_app/pages/favorite_page.dart';
import 'package:wallpapper_app/pages/wallpaper_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen() {
    return [
      const WallpaperPage(),
      const CategoryPage(),
      const SearchPage(),
      const FavoritePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: const Color.fromRGBO(100, 198, 248, 1),
        inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
        // textStyle: const TextStyle(fontSize: 17),
        icon: const Icon(
          Icons.wallpaper,
        ),
        title: 'Wallpapers',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: const Color.fromRGBO(100, 198, 248, 1),
        inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
        // textStyle: const TextStyle(fontSize: 17),
        icon: const Icon(
          Icons.collections,
        ),
        title: 'Category',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: const Color.fromRGBO(100, 198, 248, 1),
        inactiveColorPrimary: const Color.fromRGBO(130, 131, 131, 1),
        // textStyle: const TextStyle(fontSize: 17),
        icon: const Icon(
          Icons.search,
          // Icons.card_giftcard_outlined,
        ),
        title: 'Search',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: const Color.fromRGBO(100, 198, 248, 1),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        screens: _buildScreen(),
        items: _navBarItem(),
        // backgroundColor: const Color.fromRGBO(47, 47, 46, 1),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
