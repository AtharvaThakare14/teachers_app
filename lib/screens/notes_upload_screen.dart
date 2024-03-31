import 'package:flutter/material.dart';
import 'package:teachers_app/components/course_info_card.dart';
import 'package:teachers_app/components/note_info_card.dart';
import 'package:teachers_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:teachers_app/screens/question_upload_screen.dart';

import '../models/course_info_model.dart';

class NotesUploadScreen extends StatefulWidget {
  const NotesUploadScreen({super.key});

  @override
  State<NotesUploadScreen> createState() => _NotesUploadScreenState();
}

class _NotesUploadScreenState extends State<NotesUploadScreen> {
  bool _showNotes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Upload")),
        body: Column(children: [
          Expanded(
            child: MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              minWidth: double.infinity,
              color: _showNotes ? Colors.white : kPrimaryColor,
              child: Text(
                "Question Paper",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: !_showNotes ? Colors.white : kPrimaryColor,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              minWidth: double.infinity,
              color: !_showNotes ? Colors.white : kPrimaryColor,
              child: Text(
                "Notes",
                style: TextStyle(
                  fontSize: 16,
                  color: _showNotes ? Colors.white : kPrimaryColor,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ]));
  }
}
