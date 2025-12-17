import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trip_app/util/navigator_util.dart';

import '../pages/home_page.dart';
import '../pages/my_page.dart';
import '../pages/search_page.dart';
import '../pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    NavigatorUtil.updateContext(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ), // <--- 写完一个Item，加逗号，换行

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '搜索',
          ), // <--- 逗号

          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: '旅拍',
          ), // <--- 逗号

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
