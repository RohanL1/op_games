import 'package:flutter/material.dart';
import 'package:op_games/operator.dart';
import 'package:op_games/question_data/questions.dart';
import 'package:op_games/widgets/answer_card.dart';
import 'package:op_games/widgets/next_button.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;

  void pickAnswer(int value){
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex){

    }
    setState(() {});
  }

  void gotoNextQuestion(){
    if (questionIndex < questions.length - 1){
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length-1;
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
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:
      Padding(
        padding: const EdgeInsets.fromLTRB(24,100, 24,24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Container(
              height: 100,
              width: 1500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                question.question,
                style: const TextStyle(
                  // backgroundColor: Colors.grey,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? ()=> pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            // Next button
            isLastQuestion
              ? RectangularButton(
                onPressed:() {
                  Navigator.pop(context);
                } ,
               label: 'back',
              )
                : RectangularButton(
                  onPressed: 
                      selectedAnswerIndex != null ? gotoNextQuestion : null , // () => Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage())),
                 label: 'next',
                 ),
          ],
          ),
        ),
      ));
  }
}