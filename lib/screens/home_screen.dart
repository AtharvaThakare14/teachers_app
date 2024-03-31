import 'package:flutter/material.dart';
import 'package:teachers_app/constants.dart';
import 'package:teachers_app/screens/home_screen_pages.dart/course_search_page.dart';
import 'package:teachers_app/screens/home_screen_pages.dart/favourite_page.dart';
import 'package:teachers_app/screens/home_screen.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:teachers_app/screens/home_screen_pages.dart/home_page.dart';
import 'package:teachers_app/screens/home_screen_pages.dart/notification_page.dart';
import 'package:teachers_app/screens/home_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    required this.drawerKey,
  });
  GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;
  final _navPages = [
    const HomePage(),
    const CourseSearchPage(),
    const FavouritePage(),
    const NotificationPage(),
    const CourseSearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: _navPages[_selectedNavIndex],
        appBar: AppBar(
          title: Text(
            _selectedNavIndex == 2 ? "Favorites" : "",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          // title: Text("Hi, ${studentInfo.firstName}👋"),
          leading: GestureDetector(
            onTap: () {
              setState(() {
                widget.drawerKey.currentState!.toggleDrawer();
              });
            },
            child: Icon((widget.drawerKey.currentState == null
                    ? false
                    : widget.drawerKey.currentState!.isOpened)
                ? Icons.menu_rounded
                : Icons.menu_rounded),
          ),

          // actions: [
          //   CircleAvatar(
          //     foregroundImage: studentInfo.profilePictureUrl != null
          //         ? NetworkImage(studentInfo.profilePictureUrl!)
          //         : null,
          //     radius: 20,
          //     child: Icon(Ionicons.person_outline),
          //   ),
          //   SizedBox(
          //     width: 20,
          //   )
          // ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300, //New
                  blurRadius: 15.0,
                )
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              _navBarItems(
                  label: "Home",
                  iconData: Ionicons.home_outline,
                  selectedIconData: Ionicons.home,
                  index: 0),
              _navBarItems(
                  label: "Courses",
                  iconData: Ionicons.search_outline,
                  selectedIconData: Ionicons.search,
                  index: 1),
              _navBarItems(
                  label: "Favs",
                  iconData: Ionicons.star_outline,
                  selectedIconData: Ionicons.star,
                  index: 2),
              _navBarItems(
                  label: "Alerts",
                  iconData: Ionicons.notifications_outline,
                  selectedIconData: Ionicons.notifications,
                  index: 3),
              SizedBox(
                width: 15,
              ),
              Image.asset("assets/Frame.png")
            ],
          ),
        ));
  }

  Widget _navBarItems(
      {required String label,
      required IconData iconData,
      required IconData selectedIconData,
      required int index}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedNavIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _selectedNavIndex == index ? selectedIconData : iconData,
              color: _selectedNavIndex == index ? kPrimaryColor : kGrayColor,
              size: 30,
            ),
            const SizedBox(height: 5),
            AnimatedDefaultTextStyle(
                style: TextStyle(
                    height: 1,
                    fontSize: _selectedNavIndex == index ? 13 : 0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
                duration: const Duration(milliseconds: 200),
                child: Text(
                  label,
                ))
          ],
        ),
      ),
    );
  }
}

class UserInfoController {
  // Your implementation here
}
