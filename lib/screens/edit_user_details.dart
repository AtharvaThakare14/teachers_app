import 'dart:io';

import 'package:teachers_app/constants.dart';
import 'package:teachers_app/controller/user_info_controller.dart';
import 'package:teachers_app/models/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({super.key, required this.studentInfo});
  final UserModel studentInfo;

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _dobController;

  final _bloodGroups = [
    'O +ve',
    'A +ve',
    'B +ve',
    'AB +ve',
    'O -ve',
    'A -ve',
    'B -ve',
    'AB -ve'
  ];

  @override
  Widget build(BuildContext context) {
    _dobController = TextEditingController(
      text: DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(widget.studentInfo.dob!)),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "General Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // const Text(
              //   "General Details",
              //   style: TextStyle(
              //       fontSize: 20, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.start,
              // ),
              // const SizedBox(height: 10),
              _label(" Name"),
              TextFormField(
                initialValue: widget.studentInfo.firstName,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  isDense: true,
                ),
                onChanged: (val) {
                  widget.studentInfo.firstName = val;
                },
                validator: (value) => value!.toString().trim().isEmpty
                    ? 'Please Enter Your First name'
                    : null,
              ),
              // _label("Last Name"),
              // TextFormField(
              //   initialValue: widget.studentInfo.lastName,
              //   cursorColor: kPrimaryColor,
              //   keyboardType: TextInputType.emailAddress,
              //   textInputAction: TextInputAction.next,
              //   style: const TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   decoration: InputDecoration(
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: kPrimaryColor),
              //     ),
              //     isDense: true,
              //   ),
              //   onChanged: (val) {
              //     widget.studentInfo.lastName = val;
              //   },
              //   validator: (value) => value!.toString().trim().isEmpty
              //       ? 'Please Enter Your Last name'
              //       : null,
              // ),
              const SizedBox(height: 10),
              _label("Degree"),
              TextFormField(
                initialValue: widget.studentInfo.degree,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  isDense: true,
                ),
                onChanged: (val) {
                  widget.studentInfo.degree = val;
                },
                validator: (value) => value!.toString().trim().isEmpty
                    ? 'Enter Your degree '
                    : null,
              ),
              _label('Blood Group'),
              DropdownButtonFormField(
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                value: widget.studentInfo.bloodGroup == ''
                    ? null
                    : widget.studentInfo.bloodGroup,
                items: _bloodGroups
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black)),
                        ))
                    .toList(),
                onChanged: (val) {
                  widget.studentInfo.bloodGroup = val;
                },
                validator: (value) =>
                    value == null ? 'Please Enter Your Blood Group' : null,
                style: const TextStyle(fontSize: 19),
                // decoration: _formFieldInputDecoration(),
              ),
              _label('DOB'),
              TextFormField(
                controller: _dobController,
                onTap: _showDatePicker,
                readOnly: true,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(),
                style: const TextStyle(fontSize: 18),
                // decoration: _formFieldInputDecoration(
                //     iconData: Icons.calendar_month_outlined),
                onChanged: (val) {
                  widget.studentInfo.dob =
                      DateFormat('yyyy-MM-dd').format(DateTime.parse(val));
                },
                validator: (value) => value!.toString().trim().isEmpty
                    ? 'Please Enter Your Date Of Birth'
                    : null,
              ),
              _label('Mobile Number'),
              TextFormField(
                initialValue: widget.studentInfo.phoneNumber,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  isDense: true,
                ),
                onChanged: (val) {
                  widget.studentInfo.phoneNumber = val;
                },
                validator: (value) => value!.toString().trim().isEmpty ||
                        value.trim().length != 10
                    ? 'Enter your valid mobile number'
                    : null,
              ),
              _label("Address"),
              TextFormField(
                initialValue: widget.studentInfo.address,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  isDense: true,
                ),
                onChanged: (val) {
                  widget.studentInfo.address = val;
                },
                validator: (value) => value!.toString().trim().isEmpty
                    ? 'Enter your Address'
                    : null,
              ),
              _label("department"),
              TextFormField(
                initialValue: widget.studentInfo.branch,
                cursorColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  isDense: true,
                ),
                onChanged: (val) {
                  widget.studentInfo.branch = val;
                },
                validator: (value) => value!.toString().trim().isEmpty
                    ? 'Enter your College branch'
                    : null,
              ),
              _label('College ID'),
              TextFormField(
                enabled: false,
                initialValue: widget.studentInfo.collegeId,
                cursorColor: kPrimaryColor,
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontSize: 18),
                //  decoration: _formFieldInputDecoration(),
                onChanged: (val) {
                  widget.studentInfo.collegeId = val;
                },
                validator: (value) => value!.toString().trim().isEmpty
                    ? 'Please Enter Your College ID'
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: kPrimaryColor,
                  elevation: 0,
                  minWidth: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Row(
                      children: [
                        // Image.asset("assets/Frame.png"),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 80),
                        Icon(
                          Icons.repeat_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Update",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      UserModel updatedInfo = widget.studentInfo;
                      print(updatedInfo.toJson());
                      Provider.of<UserInfoController>(context, listen: false)
                          .updateDocument(
                              context: context, userInfo: updatedInfo)
                          .then(
                            (_) => Navigator.pop(context),
                          );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Text(
          text,
          style: TextStyle(
              color: kGrayColor, fontWeight: FontWeight.w600, fontSize: 12),
        ),
      );

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.parse(_dobController.text),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) => {
          setState(() {
            _dobController.text = value!.toString().split(' ')[0];
            widget.studentInfo.dob = _dobController.text;
          })
        });
  }

  InputDecoration _formFieldInputDecoration({IconData? iconData}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kErrorColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            )),

        //icon
        suffixIcon: iconData == null
            ? null
            : Icon(
                iconData,
                size: 24,
              ),

        //       // Border When error

        //       focusedErrorBorder: OutlineInputBorder(
        //         borderSide: BorderSide(width: 2, color: kErrorColor),
        //         borderRadius: const BorderRadius.all(
        //           Radius.circular(6.0),
        //         ),
        //       ),

        //       errorBorder: OutlineInputBorder(
        //         borderSide: BorderSide(width: 2, color: kErrorColor),
        //         borderRadius: const BorderRadius.all(
        //           Radius.circular(6.0),
        //         ),
        //       ),

        //       // border when selected
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),

        //       // border

        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(width: 1, color: kGrayColor),
        //   borderRadius: const BorderRadius.all(
        //     Radius.circular(6.0),
        //   ),
        // ),
      );
}

ImageProvider getImageProvider(String path) {
  final uri = Uri.parse(path);
  if (uri.scheme == 'http' || uri.scheme == 'https') {
    return NetworkImage(path);
  } else {
    return FileImage(File(path));
  }
}
