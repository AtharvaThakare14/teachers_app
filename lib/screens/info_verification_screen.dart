import 'package:teachers_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachers_app/screens/main_screen.dart';

class InfoVerificationScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  InfoVerificationScreen({super.key});

  @override
  State<InfoVerificationScreen> createState() => _InfoVerificationScreenState();
}

class _InfoVerificationScreenState extends State<InfoVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Greetings
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Verify",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                kUserInfo.profilePictureUrl == null
                    ? CircleAvatar(
                        backgroundColor: kGrayColor,
                        radius: 60,
                      )
                    : SizedBox(
                        height: 120,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: CircleAvatar(
                            foregroundImage:
                                NetworkImage(kUserInfo.profilePictureUrl!),
                            backgroundColor: kGrayColor,
                            radius: 60,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "General Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      _infoTag("Name", "${kUserInfo.firstName!} "),
                      _infoTag("College ID", kUserInfo.collegeId!),
                      _infoTag("DOB", kUserInfo.dob!),
                      _infoTag("Blood Group", kUserInfo.bloodGroup!),
                      _infoTag("Degree", kUserInfo.degree!),
                      _infoTag("Department", kUserInfo.branch!),
                      _infoTag("Mobile Number", kUserInfo.phoneNumber!),
                      _infoTag("Address", kUserInfo.address!),
                    ],
                  ),
                ),

                const Spacer(),
                // Sign in Button
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: Row(
                    children: [
                      Flexible(
                        child: MaterialButton(
                            height: 50,
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 2, color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                            minWidth: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mode_edit_outline_outlined,
                                  size: 20,
                                  color: kPrimaryColor,
                                ),
                                Text(
                                  "Modify",
                                  style: TextStyle(
                                      fontSize: 16, color: kPrimaryColor),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: MaterialButton(
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: kPrimaryColor,
                            elevation: 0,
                            minWidth: double.infinity,
                            child: const Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () {
                              //   Provider.of<UserInfoController>(context,
                              //           listen: false)
                              //       .setUserInfo(mounted,
                              //           context: context, userInfo: kUserInfo)
                              //       .then(
                              (value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen()),
                                  );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Consumer<UserInfoController>(
          //   builder: (context, userInfoController, _) {
          //     if (userInfoController.isLoading) {
          //       return const Loader();
          //     }
          //     return const SizedBox();
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _infoTag(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, color: kGrayColor),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
}
