import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teachers_app/constants.dart';
import 'package:teachers_app/screens/auth_pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _emailText;
  String? _passwordText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Lottie.asset("assets/animations/lotties/login.json"),

                          // Greetings
                          Column(
                            children: [
                              const Text(
                                "Welcome Back",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              Text("Welcome Back! Please enter your Details",
                                  style: kBody14Medium),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Input form
                      SizedBox(
                          width: double.infinity,
                          child: Text("Email Address",
                              textAlign: TextAlign.start,
                              style: kBody14Medium)),
                      TextFormField(
                        cursorColor: kPrimaryColor,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                        ),
                        onSaved: (newValue) {
                          _emailText = newValue;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Password",
                              textAlign: TextAlign.start,
                              style: kBody14Medium)),
                      TextFormField(
                        cursorColor: kPrimaryColor,
                        obscureText: _showPassword,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  _showPassword = !_showPassword;
                                },
                              );
                            },
                            child: Icon(
                              !_showPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: kGrayColor,
                            ),
                          ),
                        ),
                        onSaved: (newValue) {
                          _passwordText = newValue;
                        },
                        validator: (value) => value!.toString().trim().isEmpty
                            ? 'Enter your password'
                            : null,
                      ),

                      // Actions - forget password
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            height: 18,
                            width: 12,
                            child: Transform.scale(
                              scale: .7,
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: kPrimaryColor,
                                side: BorderSide(color: kGrayColor, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _rememberMe = value ?? false;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text("Remember me",
                              textAlign: TextAlign.start, style: kBody12Medium),
                          Expanded(
                            child: Container(),
                          ),
                          Text("Forgot Password",
                              textAlign: TextAlign.start, style: kBody12Medium)
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Sign in Button
                      MaterialButton(
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: kPrimaryColor,
                        elevation: 0,
                        minWidth: double.infinity,
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20),

                      // Sign in with google button
                      MaterialButton(
                        height: 50,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: kGrayColor),
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        minWidth: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/google-logo.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Sign In with Google",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Sign up

                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a account?",
                                style:
                                    TextStyle(color: kGrayColor, fontSize: 12)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                " Sign up",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
