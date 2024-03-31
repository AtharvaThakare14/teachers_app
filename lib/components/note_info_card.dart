import 'package:teachers_app/constants.dart';
import 'package:teachers_app/models/course_info_model.dart';
import 'package:teachers_app/screens/pdf_view_screen.dart';
import 'package:flutter/material.dart';

class NotesInfoCard extends StatelessWidget {
  final CourseInfo courseInfo;
  const NotesInfoCard({super.key, required this.courseInfo});

  final bool = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PDFViewScreen()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300, //New
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseInfo.subjectName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      courseInfo.institute,
                      style: TextStyle(
                        color: kGrayColor,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.star_border_rounded),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
