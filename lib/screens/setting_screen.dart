import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';

class SettingScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SettingScreen({super.key, required this.drawerKey});
  GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              setState(() {
                widget.drawerKey.currentState!.toggleDrawer();
              });
            },
            icon: Icon((widget.drawerKey.currentState == null
                    ? false
                    : widget.drawerKey.currentState!.isOpened)
                ? Icons.menu_rounded
                : Icons.menu_rounded),
          ),
          title: const Text(
            "Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_outline_rounded),
              onPressed: () {
                // Handle the action when the IconButton is pressed
                print('Search button pressed!');
              },
            )
          ]),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: Icon(Icons.notifications_none),
                title: Text(
                  "Clear Cache",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.verified_user_outlined),
                title: Text(
                  "Privacy",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.assignment),
                title: Text(
                  "Terms and Condition",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.question_mark_rounded),
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.group_outlined),
                title: Text(
                  "Tell a Friend",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
