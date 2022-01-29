// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:diet_app_ui/models/upperBodyWorkout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF200087),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                ListTile(
                  title: Text(
                    "${DateFormat('EEEE').format(today)}, ${DateFormat('d MMMM').format(today)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Upper Body",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white38,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "60 mins",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shutter_speed_outlined,
                            color: Colors.white38,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Easy",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                for (int i = 0; i < upperBody.length; i++)
                  Column(
                    children: <Widget>[
                      for (int j = 0; j < upperBody[i].length; j++)
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: const Color(0xFF5B4D9D),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Image.asset(
                              upperBody[i][j].imagePath,
                              width: 45,
                              height: 45,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            upperBody[i][j].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            upperBody[i][j].instruction,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
