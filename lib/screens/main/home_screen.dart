import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/header_bar.dart';
import 'package:learning_app/widgets/course_status_card.dart';
import 'package:learning_app/widgets/course_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: default_,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        // add background color

        children: [
        
          Positioned(
              // add card with no content just card with background add border radius
              bottom: 0,
              height: MediaQuery.of(context).size.height * 0.6,
              // get full width of the parent
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                  color: dark_100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              )
            ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const HeaderBar(),
              const CourseStatusCard(),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child:  const Text(
                  'Recommendation',
                  style: TextStyle(
                    color: light_200,
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              const SizedBox(height: 20),
              // add SingleChildScrollView
              Expanded(
                
                child: SingleChildScrollView(
                
                scrollDirection: Axis.vertical,
                child: Column(
                  children: const [
                    CourseCard(),
                    CourseCard(),
                    CourseCard(),
                    CourseCard(),
                    CourseCard(),
                    CourseCard()
                  ],
                ),
              )
              ),
              
            ],
          )
 

        ],
      ),
    );
  }
}
