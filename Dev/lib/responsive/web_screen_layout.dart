import 'package:flutter/material.dart';
import 'package:petbook/providers/json_details.dart';
import 'package:petbook/resources/firestore_methods.dart';
import 'package:petbook/utils/global_variables.dart';
import 'package:provider/provider.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    FireStoreMethods().getNameAndAddress();
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
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetailsProvider>(context).getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.location_pin,
              color: (_page == 1) ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.article_rounded,
              color: (_page == 2) ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(1),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: (_page == 3) ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(2),
          ),
          IconButton(
            icon: Icon(
              Icons.search_sharp,
              color: (_page == 4) ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(3),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag,
              color: (_page == 5) ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(3),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: _page == 6 ? Colors.orange : Colors.grey,
            ),
            onPressed: () => navigationTapped(4),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
    );
  }
}
