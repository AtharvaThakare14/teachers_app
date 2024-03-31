import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teachers_app/models/user_info_model.dart';
import 'package:teachers_app/constants.dart';
import 'package:teachers_app/controller/user_info_controller.dart';
import 'package:teachers_app/utilis.dart';
import 'package:teachers_app/controller/auth_controller.dart';
import 'package:teachers_app/screens/edit_user_details.dart';

class ProfileUpdateScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfileUpdateScreen({super.key, required this.drawerKey});
  GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext pageContext) {
    UserModel studentInfo = Provider.of<UserInfoController>(context).userInfo!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Center(
          child: const Text(
            "Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Greetings

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topRight: Radius.circular(100))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Consumer<UserInfoController>(
                          builder: (context, userinfoProvider, _) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      contentPadding: const EdgeInsets.all(10),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 20.0),
                                            child: Text("Profile Photo",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: kPrimaryColor
                                                    .withAlpha(100),
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: studentInfo
                                                          .profilePictureUrl !=
                                                      null
                                                  ? Image.network(
                                                      studentInfo
                                                          .profilePictureUrl!,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .account_circle_outlined,
                                                      size: 200,
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: MaterialButton(
                                                    height: 50,
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 2,
                                                            color:
                                                                kPrimaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    elevation: 0,
                                                    minWidth: double.infinity,
                                                    child: Text(
                                                      "Change",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: kPrimaryColor),
                                                    ),
                                                    onPressed: () async {
                                                      if (!userinfoProvider
                                                          .isLoading) {
                                                        final ImagePicker
                                                            picker =
                                                            ImagePicker();
                                                        var pickedImage =
                                                            await picker
                                                                .pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                        );

                                                        if (pickedImage ==
                                                            null) {
                                                          return;
                                                        }

                                                        CroppedFile?
                                                            croppedFile =
                                                            await ImageCropper()
                                                                .cropImage(
                                                          sourcePath:
                                                              pickedImage.path,
                                                          aspectRatio:
                                                              const CropAspectRatio(
                                                                  ratioX: 1,
                                                                  ratioY: 1),
                                                        );

                                                        if (croppedFile ==
                                                            null) {
                                                          return;
                                                        }
                                                        if (!mounted) return;
                                                        Navigator.pop(context);

                                                        Provider.of<UserInfoController>(
                                                                pageContext,
                                                                listen: false)
                                                            .uploadImage(
                                                          context: context,
                                                          imagePath:
                                                              croppedFile.path,
                                                          shouldUpdate: true,
                                                        )
                                                            .then((value) {
                                                          if (value != null) {
                                                            studentInfo
                                                                    .profilePictureUrl =
                                                                value;
                                                            Provider.of<UserInfoController>(
                                                                        pageContext,
                                                                        listen:
                                                                            false)
                                                                    .changeUserInfo =
                                                                studentInfo;
                                                          }
                                                        });
                                                      }
                                                    }),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: MaterialButton(
                                                    height: 50,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                    color: kPrimaryColor,
                                                    elevation: 0,
                                                    minWidth: double.infinity,
                                                    child: const Text(
                                                      "Ok",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    }),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                foregroundImage:
                                    studentInfo.profilePictureUrl != null &&
                                            !userinfoProvider.isLoading
                                        ? NetworkImage(
                                            studentInfo.profilePictureUrl!)
                                        : null,
                                radius: 60,
                                child: userinfoProvider.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : const Icon(Icons.account_circle_outlined,
                                        size: 50),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: kPrimaryColor,
                                    radius: 12,
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: kWhite,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${studentInfo.firstName!} ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            Text(
                              "${studentInfo.degree!} in ${studentInfo.branch!}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statusTag("Attendence", "23%"),
                        _statusTag("CGPA", "5.2"),
                        _statusTag("Cleared", "04"),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "General Information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return
                            // ChangeNotifierProvider.value(
                            //     value:
                            //         Provider.of<AuthController>(pageContext),
                            //     child:
                            EditUserDetails(
                          studentInfo: studentInfo,
                        );
                        //  )
                      },
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      _infoTag("Blood Group", studentInfo.bloodGroup!),
                      _infoTag(
                          "DOB",
                          DateFormat('dd MMM y')
                              .format(DateTime.parse(studentInfo.dob!))),
                      _infoTag("Mobile Number", studentInfo.phoneNumber!),
                      _infoTag("Address", studentInfo.address!),
                      _infoTag("Department", studentInfo.branch!),
                      _infoTag("College ID", studentInfo.collegeId!),
                    ],
                  ),
                ),
              ),
            ),
            // Sign in Button
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: kPrimaryColor,
                  elevation: 0,
                  minWidth: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Icon(
                          Icons.exit_to_app_sharp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Provider.of<AuthController>(context, listen: false)
                        .signOut();
                  }),
            ),

            // Sign in with google button
          ],
        ),
      ),
    );
  }

  Widget _statusTag(String label, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
          )
        ],
      );

  Widget _infoTag(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, color: kGrayColor),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      );
}
