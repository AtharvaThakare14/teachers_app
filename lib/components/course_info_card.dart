import 'package:teachers_app/constants.dart';
import 'package:teachers_app/models/course_info_model.dart';
import 'package:teachers_app/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CourseInfoCard extends StatefulWidget {
  final CourseInfo courseInfo;
  final bool isButton;
  const CourseInfoCard(
      {super.key, required this.courseInfo, this.isButton = true});

  @override
  State<CourseInfoCard> createState() => _CourseInfoCardState();
}

class _CourseInfoCardState extends State<CourseInfoCard> {
  Color _cardColor = Colors.white;

  @override
  void initState() {
    super.initState();

    // List<Color> colorList = [
    //   Color(0xffFFA6A6),
    //   Color(0xff9EBCFF),
    //   Color(0xff59D981),
    //   Color(0xff56FFF5),
    //   Color(0xffFFB656),
    // ];

    _cardColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
  }

  int random = 0;
  randomGenerate() {
    setState(() {
      random = math.Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          if (widget.isButton == false) return;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                        courseInfo: widget.courseInfo,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100, //New
                  blurRadius: 20.0,
                )
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Center(
                              child: Text('01',
                                  style: TextStyle(
                                    fontSize: 15,
                                    //   color: colorList.elementAt(random)),
                                  )),
                            ),
                            // width: 30,
                            // height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              color: _cardColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.courseInfo.subjectName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff475467)),
                                ),
                                Text(
                                  'Course code: ${widget.courseInfo.subjectID}',
                                  style: const TextStyle(
                                      fontSize: 9, color: Color(0xff475467)),
                                ),
                                Text(
                                  widget.courseInfo.institute,
                                  style: TextStyle(
                                    color: kGrayColor,
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 10),
                ],
              )),
        ),
      ),
    );
  }
}
