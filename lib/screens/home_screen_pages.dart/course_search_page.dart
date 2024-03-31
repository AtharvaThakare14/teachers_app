import 'package:teachers_app/constants.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class CourseSearchPage extends StatefulWidget {
  const CourseSearchPage({super.key});

  @override
  State<CourseSearchPage> createState() => _CourseSearchPageState();
}

class _CourseSearchPageState extends State<CourseSearchPage> {
  final _searchTextController = TextEditingController();
  bool _searched = false;
  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Search",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _searchTextController,
                cursorColor: kGrayColor,
                onChanged: (value) {
                  if (value.trim().isEmpty) return;
                  setState(() {
                    _searched = true;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "e.g : English, Hindi, Science etc",
                  suffixIcon: IconButton(
                    icon: const Icon(Ionicons.search),
                    onPressed: () {
                      // Search Function
                    },
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
              _searched
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: LottieBuilder.asset(
                            "assets/animations/lotties/search.json",
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "No Result Found",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          " with : ${_searchTextController.text}",
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
