import 'package:e_book/json/root_app_json.dart';
import 'package:e_book/pages/favourite_page.dart';
import 'package:e_book/pages/home_page.dart';
import 'package:e_book/pages/my_book_page.dart';
import 'package:e_book/pages/store_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    return SalomonBottomBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      items: List.generate(rootAppJson.length, (index) {
        return SalomonBottomBarItem(
          selectedColor: primary,
          icon: Icon(rootAppJson[index]["icon"]),
          title: Text(rootAppJson[index]["text"]),
        );
      }),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [HomePage(), MyBookPage(), StorePage(), FavouritePage()],
    );
  }
}
