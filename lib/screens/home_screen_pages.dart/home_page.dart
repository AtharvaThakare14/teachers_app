import 'package:teachers_app/components/course_info_card.dart';
import 'package:teachers_app/models/course_info_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /** 
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300, //New
                              blurRadius: 10.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "John Wattson",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "B.A. in Bachelor of Arts",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              )
                            ],
                          ),
                          Transform.rotate(
                            angle: -45,
                            child: Image.asset(
                              "assets/animations/gifs/gear.gif",
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    */
                SizedBox(height: 20),
                Text(
                  "Course List",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: mockCourses.length,
              itemBuilder: (BuildContext context, int index) {
                return CourseInfoCard(
                  courseInfo: mockCourses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
