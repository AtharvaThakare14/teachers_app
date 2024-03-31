import 'package:flutter/material.dart';
import 'package:teachers_app/constants.dart';

class questionupload extends StatefulWidget {
  const questionupload({Key? key}) : super(key: key);

  @override
  State<questionupload> createState() => _questionuploadState();
}

class _questionuploadState extends State<questionupload> {
  bool _showNotes = false;

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
        Row(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              )),
            ),
            Container(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              )),
            )
          ],
        )
      ]),
    );
  }
}
