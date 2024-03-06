import 'package:flutter/material.dart';
import 'package:op_games/OpMatchGame.dart';
import 'package:op_games/Quiz_page.dart';
import 'package:op_games/level2_quiz_screen.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play',
            style: TextStyle(fontFamily: 'Playful', color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black, // Start color
                Colors.white, // End color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        // Make the AppBar's background transparent to show the gradient
        elevation: 0, // Remove shadow
        iconTheme: IconThemeData(
          color: Colors.white, // Choose your color here
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(160.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                levelCard(
                    context, 'Level 0 -   Basic Match Game ', Icons.looks_one,
                    OperatorsMatchingGamePage()),
                levelCard(
                    context, 'Level 1 -   Quiz ', Icons.looks_two, QuizPage()),
                levelCard(
                    context, 'Level 2 -   Fill the literals ', Icons.looks_3,
                    PlayScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget levelCard(BuildContext context, String level, IconData icon,
      Widget nextPage) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => nextPage));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          // Adjusted for consistent padding
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align text to the start
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the icon and text horizontally
                children: [
                  Icon(icon, size: 50, color: Colors.white),
                  SizedBox(width: 10),
                  // Reduce space to bring text closer to the icon
                  Expanded( // Wrap Text in Expanded to prevent overflow
                    child: Text(
                      level,
                      style: TextStyle(fontSize: 34,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Playful',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}