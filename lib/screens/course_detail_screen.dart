import 'package:teachers_app/components/course_info_card.dart';
import 'package:teachers_app/components/note_info_card.dart';
import 'package:teachers_app/constants.dart';
import 'package:flutter/material.dart';

import '../models/course_info_model.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.courseInfo});
  final CourseInfo courseInfo;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool _showNotes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Course Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                CourseInfoCard(courseInfo: widget.courseInfo, isButton: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Flexible(
                  child: MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    minWidth: double.infinity,
                    color: _showNotes ? Colors.white : kPrimaryColor,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Question Paper",
                      style: TextStyle(
                        fontSize: 14,
                        color: !_showNotes ? Colors.white : kPrimaryColor,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _showNotes = false;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    color: !_showNotes ? Colors.white : kPrimaryColor,
                    elevation: 0,
                    minWidth: double.infinity,
                    child: Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 16,
                        color: _showNotes ? Colors.white : kPrimaryColor,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _showNotes = true;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          !_showNotes
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return NotesInfoCard(courseInfo: mockCourses[index]);
                      },
                    ),
                  ),
                )
              : const Expanded(
                  child: Center(
                    child: Text(
                      "No Items to Show",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
