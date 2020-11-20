import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'Pages/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = new PageController(initialPage: 0);
  int current;

  @override
  void initState() {
    super.initState();
    current = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(411.4, 820.6), allowFontScaling: true);
    var color = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Learner\'s Digital',
          style: TextStyle(fontFamily: 'ProductSans', color: color),
        ),
        leading: Icon(FlutterIcons.book_ent, color: color),
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) => setState(() => current = index),
        children: [
          Home(),
          Center(
              child: Text(
            '2',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          )),
          Center(
              child: Text(
            '3',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ))
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
          items: <FloatingNavbarItem>[
            FloatingNavbarItem(icon: FlutterIcons.home_ent, title: 'Home'),
            FloatingNavbarItem(icon: FlutterIcons.play_ant, title: 'Courses'),
            FloatingNavbarItem(
                icon: FlutterIcons.user_ent, title: 'My Learning')
          ],
          currentIndex: current,
          backgroundColor: Colors.white,
          unselectedItemColor: color,
          selectedBackgroundColor: color,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              current = index;
            });
            _controller.animateToPage(index,
                duration: Duration(milliseconds: 250), curve: Curves.ease);
          }),
    );
  }
}
