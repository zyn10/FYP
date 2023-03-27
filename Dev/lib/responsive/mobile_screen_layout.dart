import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petbook/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? Colors.orange : Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_pin,
                color: (_page == 1) ? Colors.orange : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.article_rounded,
                color: (_page == 2) ? Colors.orange : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: (_page == 3) ? Colors.orange : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (_page == 4) ? Colors.orange : Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              color: (_page == 5) ? Colors.orange : Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 6) ? Colors.orange : Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
