import 'package:flutter/material.dart';
import 'package:op_games/quiz_section/OpMatchGame.dart';
import 'package:op_games/quiz_section/Quiz_page.dart';
import 'package:op_games/quiz_section/text_quiz.dart';
import 'package:op_games/quiz_section/Score_page.dart';

import 'package:op_games/quiz_section/mcq_quiz.dart';

const cust_light_green = const Color(0x8AC5C9);
class LevelSelectionContainer extends StatelessWidget {
  final String levelText;
  final Widget nextPage;
  final Color startColor;
  final Color endColor;

  const LevelSelectionContainer({
    Key? key,
    required this.levelText,
    required this.nextPage,
    this.startColor = Colors.blue,
    this.endColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              levelText,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightBlue,
        shape: CircleBorder(),

        child: const Icon(Icons.arrow_back_ios),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text('LEVELS',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  SizedBox(height: 70),
                  Row(
                      children :[
                        SizedBox(width: 70),

                        LevelSelectionContainer(levelText: 'LVL 0', nextPage: OperatorsMatchingGamePage()),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 1', nextPage: QuizPage()),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 2', nextPage: TextQuiz(opSign:'+')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 3', nextPage: McqQuiz(opSign: '-',)),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 4', nextPage: TextQuiz(opSign:'-')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL5', nextPage: McqQuiz(opSign: 'x',)),
                      ]
                  ),
                  SizedBox(height: 70),
                  Row(
                      children :[
                        SizedBox(width: 70),
                        LevelSelectionContainer(levelText: 'LVL 6', nextPage: TextQuiz(opSign:'x')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 7', nextPage: McqQuiz(opSign: '÷',)),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 8', nextPage: TextQuiz(opSign:'÷')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 9', nextPage: McqQuiz(opSign: 'mix',)),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 10', nextPage: TextQuiz(opSign:'mix')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: 'LVL 11', nextPage: TextQuiz(opSign:'mix')),

                      ]
                  ),
                ],
              )
          )
      ),

    );
  }

  
  Widget levelCard(BuildContext context, String level, IconData icon,
      Widget nextPage) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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