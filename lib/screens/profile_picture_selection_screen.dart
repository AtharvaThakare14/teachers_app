import 'package:flutter/material.dart';
import 'package:teachers_app/constants.dart';
import 'package:teachers_app/screens/info_verification_screen.dart';

class ProfilePictureSelectionScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfilePictureSelectionScreen({super.key});

  @override
  State<ProfilePictureSelectionScreen> createState() =>
      _ProfilePictureSelectionScreenState();
}

class _ProfilePictureSelectionScreenState
    extends State<ProfilePictureSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  // Greetings
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Profile Picture",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Profile Picture",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                  // Sign in Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: MaterialButton(
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: kPrimaryColor,
                      elevation: 0,
                      minWidth: double.infinity,
                      child: const Text(
                        "Verify",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                InfoVerificationScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Sign in with google button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
