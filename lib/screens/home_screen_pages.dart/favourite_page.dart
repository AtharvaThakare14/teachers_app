import 'package:teachers_app/components/note_info_card.dart';
import 'package:teachers_app/constants.dart';
import 'package:teachers_app/models/course_info_model.dart';
import 'package:teachers_app/screens/home_screen_pages.dart/course_search_page.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  bool _showNotes = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(height: 20),
          //       Text(
          //         "Favourites",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          //       ),
          //     ],
          //   ),
          // ),
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
                      "Question Paper",
                      textAlign: TextAlign.center,
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
                      "Note list",
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
