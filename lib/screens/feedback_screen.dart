import 'package:teachers_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';

class FeedBackScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FeedBackScreen({super.key, required this.drawerKey});
  final GlobalKey<SliderDrawerWidgetState> drawerKey;

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  int _rateScore = 3;
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
          "FeedBack",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                Text(
                  "What do you think ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kGrayColor),
                ),
                const SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     _rateEmoji(1),
                //     _rateEmoji(2),
                //     _rateEmoji(3),
                //     _rateEmoji(4),
                //     _rateEmoji(5),
                //   ],
                // ),
                const SizedBox(height: 30),
                _label("Please select a Subject"),
                TextFormField(
                  cursorColor: kPrimaryColor,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      hintText: 'Please Choose',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) => value!.toString().trim().isEmpty
                      ? 'Please Enter Your name'
                      : null,
                ),
                _label("Email"),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value) => value!.toString().trim().isEmpty
                        ? 'Please Enter Your Email'
                        : null),

                // TextFormField(
                //   cursorColor: kPrimaryColor,
                //   readOnly: false,
                //   style: const TextStyle(fontSize: 14),
                //   decoration: _formFieldInputDecoration(),
                //   validator: (value) => value!.toString().trim().isEmpty
                //       ? 'Please Enter Your Email'
                //       : null,
                // ),
                _label("FeedBack"),
                TextFormField(
                  cursorColor: kPrimaryColor,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      hintText: 'Write your Feedback here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  maxLines: 8,
                  validator: (value) => value!.toString().trim().isEmpty
                      ? 'Please Enter Your name'
                      : null,
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: kPrimaryColor,
                  elevation: 0,
                  minWidth: double.infinity,
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rateEmoji(int score) => GestureDetector(
        onTap: () {
          setState(() {
            _rateScore = score;
          });
        },
        child: Opacity(
          opacity: score == _rateScore ? 1 : .5,
          child: Image.asset("assets/feedback/rate-$score.png"),
        ),
      );
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
          style: TextStyle(
              color: kGrayColor, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );
}
