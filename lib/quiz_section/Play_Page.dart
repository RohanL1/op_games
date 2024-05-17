import 'package:flutter/material.dart';
import 'package:op_games/quiz_section/OpMatchGame.dart';
import 'package:op_games/quiz_section/Quiz_page.dart';
import 'package:op_games/quiz_section/text_quiz.dart';
import 'package:op_games/quiz_section/mcq_quiz.dart';
import 'package:op_games/common/global.dart';

class LevelSelectionContainer extends StatelessWidget {
  final String levelText;
  final Widget nextPage;
  final Color startColor;
  final Color endColor;
  final isUnlocked;

  const LevelSelectionContainer({
    Key? key,
    required this.levelText,
    required this.nextPage,
    this.startColor = Colors.greenAccent,
    this.endColor = Colors.white,
    required this.isUnlocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heading = isUnlocked ? Text( levelText, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),)
        : Icon(Icons.lock, size: 100, color: Colors.black38,);
    return InkWell(
      onTap: () {
        if (isUnlocked)
        Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
        else
          ()=> {};
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: isUnlocked ? [startColor, endColor] : [Colors.grey, Colors.black12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            heading,
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
    List<bool> isUnlockedList = [] ;
    for (int i = 0; i <= 11; i++){
      isUnlockedList.add(GlobalVariables.levels[i].isUnlocked);
    }
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
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'LEVELS',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.blue[700]!,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        'LEVELS',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Row(
                      children :[
                        SizedBox(width: 70),
                        LevelSelectionContainer(levelText: '0', isUnlocked: isUnlockedList[0], nextPage: OperatorsMatchingGamePage()),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '1', isUnlocked: isUnlockedList[1], nextPage: QuizPage()),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '2', isUnlocked: isUnlockedList[2], nextPage: TextQuiz(opSign:'+')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '3', isUnlocked: isUnlockedList[3], nextPage: McqQuiz(opSign: '-')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '4', isUnlocked: isUnlockedList[4], nextPage: TextQuiz(opSign:'-')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '5', isUnlocked: isUnlockedList[5] ,nextPage: McqQuiz(opSign: 'x')),

                      ]
                  ),
                  SizedBox(height: 70),
                  Row(
                      children :[
                        SizedBox(width: 70),
                        LevelSelectionContainer(levelText: '6', isUnlocked: isUnlockedList[6], nextPage: TextQuiz(opSign: 'x')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '7', isUnlocked: isUnlockedList[7], nextPage: McqQuiz(opSign: '÷')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '8', isUnlocked: isUnlockedList[8], nextPage: TextQuiz(opSign: '÷')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '9', isUnlocked: isUnlockedList[9], nextPage: McqQuiz(opSign: 'mix')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '10', isUnlocked: isUnlockedList[10], nextPage: TextQuiz(opSign: 'mix')),

                        SizedBox(width: 50),
                        LevelSelectionContainer(levelText: '11', isUnlocked: isUnlockedList[11], nextPage: TextQuiz(opSign: 'mix')),

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