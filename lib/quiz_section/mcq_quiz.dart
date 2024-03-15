import 'package:flutter/material.dart';
// import 'package:op_games/learn_section/operator.dart';
import 'package:op_games/common/widgets/answer_card.dart';
// import 'package:op_games/widgets/next_button.dart';
import 'package:op_games/common/question_data/mcq_question.dart';
import 'package:op_games/common/question_data/gen_mcq_questions.dart';

class McqQuiz extends StatefulWidget {
  final String opSign;
  const McqQuiz({Key? key,required this.opSign}) : super(key: key);

  @override
  State<McqQuiz> createState() => _McqQuizState();
}

class _McqQuizState extends State<McqQuiz> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  late double screenWidth = MediaQuery.of(context).size.width;
  late List<McqQuestion> questions;

  @override
  void initState() {
    super.initState();
    if (widget.opSign == 'mix'){
      questions = getMixMcqQuestions(widget.opSign);
    }
    else {
      questions = getMcqQuestions(widget.opSign);
    }
  }

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
            padding: const EdgeInsets.fromLTRB(50,100, 50,50),
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
                      fontSize: 40,
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
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    if (questionIndex == questions.length-1 && selectedAnswerIndex != null) {
                      Navigator.pop(context);

                    } else if (selectedAnswerIndex != null){
                      gotoNextQuestion();
                    }
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: screenWidth - screenWidth/2,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedAnswerIndex != null ? Colors.lightBlue : Colors.grey,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text( 'Next' ,
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}