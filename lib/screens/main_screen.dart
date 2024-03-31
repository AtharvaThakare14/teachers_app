import 'package:teachers_app/constants.dart';
import 'package:teachers_app/models/user_info_model.dart';
import 'package:teachers_app/screens/profile_picture_update_screen.dart';
import 'package:teachers_app/screens/home_screen.dart';
import 'package:teachers_app/screens/feedback_screen.dart';
import 'package:teachers_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedDrawerTabIndex = 0;
  final GlobalKey<SliderDrawerWidgetState> _drawerKey = GlobalKey();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  // int _selectedIndex = 0;

  // void _updateCurrentIndex(int newIndex) {
  //   print("called");
  //   setState(() {
  //     _selectedIndex = newIndex;
  //   });
  // }

  late final _drawerScreens = [
    HomeScreen(
      drawerKey: _drawerKey,
      // selectedNavIndex: _selectedIndex,
      // updateIndexFunction: _updateCurrentIndex,
    ),
    // ProfileUpdateScreen(drawerKey: _drawerKey),
    FeedBackScreen(drawerKey: _drawerKey),
    SettingScreen(drawerKey: _drawerKey),
  ];

  @override
  Widget build(BuildContext context) {
    // UserModel studentInfo =
    //     Provider.of<UserInfoController>(context, listen: false).userInfo!;
    return WillPopScope(
      onWillPop: () async {
        if (await _navigatorKey.currentState!.maybePop()) {
          return false;
        } else {
          if (_selectedDrawerTabIndex != 0) {
            setState(() {
              _selectedDrawerTabIndex = 0;
            });
            return false;
          } else {
            // print("Called $_selectedIndex");
            // if (_selectedIndex != 0) {
            //   _updateCurrentIndex(0);
            //   return false;
            // } else {
            return true;
            // }
          }
        }
      },
      child: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) {
            return SliderDrawerWidget(
              option: SliderDrawerOption(
                  sliderEffectType: SliderEffectType.Rounded,
                  backgroundColor: kPrimaryColor,
                  radiusAmount: 50,
                  upDownScaleAmount: 80),
              key: _drawerKey,
              drawer: SafeArea(
                minimum: const EdgeInsets.only(top: 30, left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            // foregroundImage: studentInfo.profilePictureUrl !=
                            //         null
                            //     ? NetworkImage(studentInfo.profilePictureUrl!)
                            //     : null,
                            // radius: 25,
                            child: const Icon(Ionicons.person_outline),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text("${studentInfo.firstName!}",
                                //     style: const TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         color: Colors.white,
                                //         fontSize: 24)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("   ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14))
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Divider(height: 50),
                            _drawerTab(0,
                                icon: Ionicons.home_outline, label: "Home"),
                            _drawerTab(1,
                                icon: Ionicons.person_outline,
                                label: "Profile"),
                            _drawerTab(2,
                                icon: Ionicons.newspaper_outline,
                                label: "Feedback"),
                            _drawerTab(3,
                                icon: Ionicons.settings_outline,
                                label: "Setting"),
                            _drawerTab(
                              null,
                              icon: Ionicons.log_out_outline,
                              label: "Logout",
                              onTap: () {
                                // Provider.of<AuthController>(context,
                                //         listen: false)
                                //     .signOut();
                              },
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Copyright \u00a9 CMA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const Text(
                        "5.48.65.2",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                    ]),
              ),
              body: _drawerScreens[_selectedDrawerTabIndex],
            );
          },
        ),
      ),
    );
  }

  Widget _drawerTab(int? index,
          {required String label,
          required IconData icon,
          void Function()? onTap}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap();
            }
            if (index == null) return;
            setState(() {
              _selectedDrawerTabIndex = index;
              _drawerKey.currentState!.toggleDrawer();
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: _selectedDrawerTabIndex == index
                    ? Colors.white
                    : kPrimaryColor,
                borderRadius: const BorderRadiusDirectional.horizontal(
                    start: Radius.circular(10), end: Radius.circular(30))),
            padding: const EdgeInsets.fromLTRB(10, 16, 0, 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 26,
                  color: _selectedDrawerTabIndex == index
                      ? Colors.black
                      : Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: _selectedDrawerTabIndex == index
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
