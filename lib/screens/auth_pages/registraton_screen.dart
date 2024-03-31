import 'package:teachers_app/constants.dart';
import 'package:flutter/services.dart';
import 'package:teachers_app/screens/auth_pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teachers_app/screens/profile_picture_selection_screen.dart';

class RegistrationScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  final PageController _pageController = PageController();

  final TextEditingController _dobController = TextEditingController();

  final double _formFontSize = 18;

  int _currentPage = 1;

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
  final _degrees = [
    'MBA',
    'BA',
    'Btech',
    'Bcom',
    'Mtech',
  ];
  @override
  void initState() {
    super.initState();
    _dobController.text = kUserInfo.dob ?? '';
  }

  @override
  void dispose() {
    _pageController.dispose();

    _dobController.dispose();

    super.dispose();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                _dobController.text = value.toString().split(' ')[0];
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  "Complete Your Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Greetings
                                Form(
                                  key: _formKey1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _label('Full Name'),
                                      TextFormField(
                                        initialValue: kUserInfo.firstName,
                                        cursorColor: kPrimaryColor,
                                        textInputAction: TextInputAction.next,
                                        style:
                                            TextStyle(fontSize: _formFontSize),
                                        decoration: _formFieldInputDecoration(),
                                        onSaved: (val) {
                                          kUserInfo.firstName = val ?? '';
                                        },
                                        validator: (value) =>
                                            value!.toString().trim().isEmpty
                                                ? 'Please Enter Your name'
                                                : null,
                                      ),
                                      // _label('Middle Name (optional)'),
                                      // TextFormField(
                                      //   initialValue: kUserInfo.middleName,
                                      //   cursorColor: kPrimaryColor,
                                      //   textInputAction: TextInputAction.next,
                                      //   style:
                                      //       TextStyle(fontSize: _formFontSize),
                                      //   decoration: _formFieldInputDecoration(),
                                      //   onSaved: (val) {
                                      //     kUserInfo.middleName = val ?? '';
                                      //   },
                                      //   validator: (value) =>
                                      //       value!.toString().trim().isEmpty
                                      //           ? 'Please Enter Your name'
                                      //           : null,
                                      // ),
                                      // _label('Last Name'),
                                      // TextFormField(
                                      //   initialValue: kUserInfo.lastName,
                                      //   cursorColor: kPrimaryColor,
                                      //   textInputAction: TextInputAction.next,
                                      //   style:
                                      //       TextStyle(fontSize: _formFontSize),
                                      //   decoration: _formFieldInputDecoration(),
                                      //   onSaved: (val) {
                                      //     kUserInfo.lastName = val ?? '';
                                      //   },
                                      //   validator: (value) =>
                                      //       value!.toString().trim().isEmpty
                                      //           ? 'Please Enter Your name'
                                      //           : null,
                                      // ),
                                      _label('College ID'),
                                      TextFormField(
                                        initialValue: kUserInfo.collegeId,
                                        cursorColor: kPrimaryColor,
                                        textInputAction: TextInputAction.next,
                                        style:
                                            TextStyle(fontSize: _formFontSize),
                                        decoration: _formFieldInputDecoration(),
                                        onSaved: (val) {
                                          kUserInfo.collegeId = val ?? '';
                                        },
                                        validator: (value) =>
                                            value!.toString().trim().isEmpty
                                                ? 'Please Enter Your College ID'
                                                : null,
                                      ),
                                      _label('DOB'),
                                      TextFormField(
                                        controller: _dobController,
                                        onTap: _showDatePicker,
                                        readOnly: true,
                                        cursorColor: kPrimaryColor,
                                        style:
                                            TextStyle(fontSize: _formFontSize),
                                        decoration: _formFieldInputDecoration(
                                            iconData:
                                                Icons.calendar_month_outlined),
                                        onSaved: (val) {
                                          kUserInfo.dob = val ?? '';
                                        },
                                        validator: (value) => value!
                                                .toString()
                                                .trim()
                                                .isEmpty
                                            ? 'Please Enter Your Date Of Birth'
                                            : null,
                                      ),
                                      _label('Blood Group'),
                                      DropdownButtonFormField(
                                          icon: const Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                          value: kUserInfo.bloodGroup == ''
                                              ? null
                                              : kUserInfo.bloodGroup,
                                          items: _bloodGroups
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e,
                                                        style: TextStyle(
                                                            fontSize:
                                                                _formFontSize,
                                                            color:
                                                                Colors.black)),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {},
                                          onSaved: (val) {
                                            kUserInfo.bloodGroup = val ?? '';
                                          },
                                          validator: (value) => value == null
                                              ? 'Please Enter Your Blood Group'
                                              : null,
                                          style: TextStyle(
                                              fontSize: _formFontSize),
                                          decoration:
                                              _formFieldInputDecoration()),
                                      _label('Mobile Number'),
                                      Container(
                                        child:
                                            // child: Row(
                                            //   children: [
                                            //     Padding(
                                            //       padding: const EdgeInsets.only(
                                            //           right: 20),
                                            //       child: Text(
                                            //         "+91",
                                            //         style: TextStyle(fontSize: 16),
                                            //       ),
                                            //     ),
                                            Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text(
                                                "+91",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                initialValue:
                                                    kUserInfo.phoneNumber != 0
                                                        ? kUserInfo.phoneNumber
                                                        : "",
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.phone,
                                                cursorColor: kPrimaryColor,
                                                style: TextStyle(
                                                  fontSize: _formFontSize,
                                                ),
                                                decoration:
                                                    _formFieldInputDecoration(),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      10),
                                                ],
                                                onSaved: (val) {
                                                  kUserInfo.phoneNumber =
                                                      val ?? "";
                                                },
                                                validator: (value) => value!
                                                            .toString()
                                                            .trim()
                                                            .isEmpty ||
                                                        value.trim().length !=
                                                            10
                                                    ? 'Enter your valid mobile number'
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 110,
                                ),
                                MaterialButton(
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    color: kPrimaryColor,
                                    elevation: 0,
                                    minWidth: double.infinity,
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey1.currentState!.validate()) {
                                        _formKey1.currentState!.save();
                                        _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear);
                                        setState(() {
                                          _currentPage++;
                                        });
                                      }
                                    }),
                                // const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Second Form

                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              // Greetings
                              Form(
                                key: _formKey2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    _label('Degree'),
                                    DropdownButtonFormField(
                                        icon: const Icon(null),
                                        value: kUserInfo.degree == ''
                                            ? null
                                            : kUserInfo.degree,
                                        items: _degrees
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e,
                                                      style: TextStyle(
                                                          fontSize:
                                                              _formFontSize,
                                                          color: Colors.black)),
                                                ))
                                            .toList(),
                                        onChanged: (val) {},
                                        onSaved: (val) {
                                          kUserInfo.degree = val ?? '';
                                        },
                                        validator: (value) =>
                                            value!.toString().trim().isEmpty
                                                ? 'Enter Your degree '
                                                : null,
                                        style:
                                            TextStyle(fontSize: _formFontSize),
                                        decoration: _formFieldInputDecoration(
                                            iconData: Icons
                                                .keyboard_arrow_down_rounded)),
                                    _label('Branch'),
                                    TextFormField(
                                      initialValue: kUserInfo.branch,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: kPrimaryColor,
                                      style: TextStyle(fontSize: _formFontSize),
                                      decoration: _formFieldInputDecoration(),
                                      onSaved: (val) {
                                        kUserInfo.branch = val ?? '';
                                      },
                                      validator: (value) =>
                                          value!.toString().trim().isEmpty
                                              ? 'Enter your College branch'
                                              : null,
                                    ),
                                    _label('Address'),
                                    TextFormField(
                                      initialValue: kUserInfo.address,
                                      cursorColor: kPrimaryColor,
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(fontSize: _formFontSize),
                                      decoration: _formFieldInputDecoration(),
                                      onSaved: (val) {
                                        kUserInfo.address = val ?? '';
                                      },
                                      validator: (value) =>
                                          value!.toString().trim().isEmpty
                                              ? 'Enter your Address'
                                              : null,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _label('City'),
                                              TextFormField(
                                                initialValue: kUserInfo.city,
                                                textInputAction:
                                                    TextInputAction.next,
                                                cursorColor: kPrimaryColor,
                                                style: TextStyle(
                                                    fontSize: _formFontSize),
                                                decoration:
                                                    _formFieldInputDecoration(),
                                                onSaved: (val) {
                                                  kUserInfo.city = val!.trim();
                                                },
                                                validator: (value) => value!
                                                        .toString()
                                                        .trim()
                                                        .isEmpty
                                                    ? 'Enter your City'
                                                    : null,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _label('State'),
                                              TextFormField(
                                                initialValue: kUserInfo.state,
                                                textInputAction:
                                                    TextInputAction.next,
                                                cursorColor: kPrimaryColor,
                                                style: TextStyle(
                                                    fontSize: _formFontSize),
                                                decoration:
                                                    _formFieldInputDecoration(),
                                                onSaved: (val) {
                                                  kUserInfo.state = val!.trim();
                                                },
                                                validator: (value) => value!
                                                        .toString()
                                                        .trim()
                                                        .isEmpty
                                                    ? 'Enter your State'
                                                    : null,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    _label('Pin Code'),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      initialValue: kUserInfo.pincode,
                                      textInputAction: TextInputAction.done,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(6)
                                      ],
                                      cursorColor: kPrimaryColor,
                                      style: TextStyle(fontSize: _formFontSize),
                                      decoration: _formFieldInputDecoration(),
                                      onSaved: (val) {
                                        kUserInfo.pincode = val ?? '';
                                      },
                                      validator: (value) =>
                                          value!.toString().trim().isEmpty ||
                                                  value.trim().length != 6
                                              ? 'Enter your Valid Pincode'
                                              : null,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 110,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: MaterialButton(
                                        height: 50,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 2, color: kPrimaryColor),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        elevation: 0,
                                        minWidth: double.infinity,
                                        child: Text(
                                          "Back",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: kPrimaryColor),
                                        ),
                                        onPressed: () {
                                          _formKey2.currentState!.save();
                                          _pageController.previousPage(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.linear);
                                          setState(() {
                                            _currentPage--;
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: MaterialButton(
                                        height: 50,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        color: kPrimaryColor,
                                        elevation: 0,
                                        minWidth: double.infinity,
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          if (_formKey2.currentState!
                                              .validate()) {
                                            _formKey2.currentState!.save();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (BuildContext
                                                        context) =>
                                                    ProfilePictureSelectionScreen(),
                                              ),
                                            );
                                            _pageController.previousPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.linear);
                                            setState(() {
                                              _currentPage--;
                                            });
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("0$_currentPage of 02",
                    style: TextStyle(color: kGrayColor, fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
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

        // Border When error

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: kErrorColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: kErrorColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),

        // border when selected
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),

        // border

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: kGrayColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
      );
  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Text(
          text,
          style: TextStyle(color: kGrayColor, fontWeight: FontWeight.w600),
        ),
      );
}
