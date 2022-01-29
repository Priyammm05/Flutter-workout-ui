// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:animations/animations.dart';
import 'package:diet_app_ui/models/meal.dart';
import 'package:diet_app_ui/pages/workout.dart';
import 'package:diet_app_ui/widgets/ingredient_progress.dart';
import 'package:diet_app_ui/widgets/meal_card.dart';
import 'package:diet_app_ui/widgets/radial_progrss.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE9E9E9),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30,
            selectedItemColor: Color(0xFF200087),
            unselectedItemColor: Colors.black38,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Person",
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: height * 0.35,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "${DateFormat('EEEE').format(today)}, ${DateFormat('d MMMM').format(today)}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Hello, Priyam',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        trailing: ClipOval(
                          child: Image.asset('images/sakuna.jpg'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          RadialProgress(
                            width: width * 0.38,
                            height: width * 0.38,
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IngredientProgress(
                                ingredient: 'Proteins',
                                leftAmount: 72,
                                progress: 0.13,
                                color: Colors.green,
                              ),
                              SizedBox(height: 10),
                              IngredientProgress(
                                ingredient: 'Carbs',
                                leftAmount: 252,
                                progress: 0.1,
                                color: Colors.red,
                              ),
                              SizedBox(height: 10),
                              IngredientProgress(
                                ingredient: 'Fats',
                                leftAmount: 61,
                                progress: 0.05,
                                color: Colors.yellowAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.38,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.51,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8, left: 32, right: 16),
                      child: Text(
                        'MEALS FOR TODAY',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 32),
                            for (var i = 0; i < meals.length; i++)
                              MealCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: OpenContainer(
                        closedElevation: 0,
                        closedColor: Color(0xFFE9E9E9),
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: Duration(milliseconds: 1000),
                        openBuilder: (context, _) {
                          return WorkOut();
                        },
                        closedBuilder: (context, VoidCallback openContainer) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkOut(),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                                left: 30,
                                right: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF20008B),
                                    Color(0xFF200087),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      'YOUR NEXT WORKOUT',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      'UPPER BODY',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'images/back.png',
                                          width: 40,
                                          height: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'images/chest.png',
                                          width: 40,
                                          height: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'images/biceps.png',
                                          width: 40,
                                          height: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'images/biceps.png',
                                          width: 40,
                                          height: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
