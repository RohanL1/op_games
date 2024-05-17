import 'package:flutter/material.dart';
import 'package:op_games/common/question_data/gen_text_questions.dart';
import 'package:op_games/common/question_data/text_question.dart';
// import 'package:op_games/common/widgets/next_button.dart';
import 'package:flutter_tts/flutter_tts.dart';
// import 'dart:developer';
import "package:op_games/common/translate/translate.dart";
import 'package:op_games/common/global.dart';
import 'package:op_games/quiz_section/result_page.dart';

class TextQuiz extends StatefulWidget {
  final String opSign;
  const TextQuiz({super.key,required this.opSign});

  @override
  State<TextQuiz> createState() => _TextQuizState();
}

class _TextQuizState extends State<TextQuiz> {
  String? selectedAnswer;
  int questionIndex = 0;
  bool? isCorrect;
  bool isAnswerSubmitted = false;
  int submissionAttempts = 0;
  String feedbackMessage = '';
  FlutterTts flutterTts = FlutterTts();
  int currentLanguage= 0;
  late Map<String, dynamic> pageLangData;
  late List<String> quesHeading;
  late List<String> LangKeys;
  int score = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> questionResults = [];


  TextEditingController textEditingController = TextEditingController();
  late List<TextQuestion> questions;
  @override
  void initState() {
    super.initState();
    if (widget.opSign == 'mix'){
      questions = getMixTextQuestions(widget.opSign);
    }
    else {
      questions = getTextQuestions(widget.opSign);
    }
    pageLangData = getMCQLanguageData(GlobalVariables.priLang, GlobalVariables.secLang);
    quesHeading = [pageLangData["ques_heading"]["pri_lang"], pageLangData["ques_heading"]["sec_lang"]];
    LangKeys = [getSpeakLangKey(GlobalVariables.priLang), getSpeakLangKey(GlobalVariables.secLang)];
  }

  Future<void> ReadOut(String text) async {
    await flutterTts.setLanguage(LangKeys[currentLanguage]);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }


  void pickAnswer(String value) {
    selectedAnswer = value;
    setState(() {
      isCorrect = null; // Reset correctness feedback
      isAnswerSubmitted = false; // Reset answer submitted status
    });
  }

  void submitAnswer() {
    if (isAnswerSubmitted) {
      return ;
    }
    final currQuestion = questions[questionIndex];
    bool correct = selectedAnswer?.toLowerCase() == currQuestion.answer.toLowerCase();
    if (correct) {
      setState(() {
        isCorrect = true;
        isAnswerSubmitted = true; // Set answer submitted status to true
        score += 2;
        correctAnswersCount++;
      });
    } else {
      setState(() {
        isCorrect = false;
        //submissionAttempts++;
        isAnswerSubmitted = true;
        // if (submissionAttempts >= 3) {
        //   isAnswerSubmitted = true; // Set answer submitted status to true
        // }
      });
    }
    questionResults.add({
      'question': currQuestion.question[currentLanguage],
      'correctAnswer': currQuestion.answer,
      'enteredAnswer': selectedAnswer,
      'isCorrect': correct,
      'sign': widget.opSign
    });
  }

  void gotoNextQuestion() {
    if (selectedAnswer == null && !isAnswerSubmitted) {
      // Show a SnackBar if no answer is submitted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please submit your answer before proceeding.'),
        ),
      );
      return;
    } // Exit the function early
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswer = null; // Clear current answer
      isCorrect = null; // Reset correctness feedback
      isAnswerSubmitted = false; // Reset answer submitted status
      textEditingController.clear(); // Clear text field
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
        correctAnswersCount: correctAnswersCount,
        totalQuestions: questions.length,
        score: score,
        questionResults: questionResults,
      )));
    }
    setState(() {});
  }

  void gotoPreviousQuestion() {
    if (questionIndex > 0) {
      questionIndex--;
      selectedAnswer = null; // Clear current answer
      isCorrect = null; // Reset correctness feedback
      isAnswerSubmitted = false; // Reset answer submitted status
      textEditingController.clear(); // Clear text field
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final quizquestion = questions[questionIndex];
    // log('data: $questions');

    bool isLastQuestion = questionIndex == questions.length - 1;
    bool isFirstQuestion = questionIndex == 0;
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 50, 24,24),
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
                child: Column(
                  children: [
                    Text(
                  'Please type your answer below',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                  Text(
                  quizquestion.question[currentLanguage],
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                  ],
                ),
              ),

              TextField(
                controller: textEditingController,
                onChanged: (value) {
                  pickAnswer(value);
                },
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
                decoration: InputDecoration(
                  hintText: '...',
                  border: OutlineInputBorder(),
                  filled: true, // Enable filling of the background
                  fillColor: isCorrect == null ? Colors.white54 : isCorrect == true ? Colors.green : Colors.red, // Set background color based on correctness
                  errorBorder: OutlineInputBorder( // Border color when there is an error
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder( // Border color when there is an error and the field is focused
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (!isFirstQuestion)
                  //   InkWell(
                  //     onTap: () {
                  //       gotoPreviousQuestion();
                  //     },
                  //     borderRadius: BorderRadius.circular(30),
                  //     child: Container(
                  //       width: 200,
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(30),
                  //         color: Colors.yellow,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'Back',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 40,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  InkWell(
                    onTap: () {
                      ReadOut('Please type your answer below, ${quizquestion.question}');
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.volume_up,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 170),
                  InkWell(
                    onTap: selectedAnswer != null && !isAnswerSubmitted
                        ? submitAnswer
                        : null,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: selectedAnswer != null && !isAnswerSubmitted
                            ? Colors.green
                            : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 180),
                  InkWell(
                    onTap: () {
                      if (!isLastQuestion || isAnswerSubmitted || selectedAnswer != null) {
                        gotoNextQuestion() ;
                      } else {
                        Navigator.pop(context);
                      }
                      },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: isAnswerSubmitted
                            ? Colors.lightBlue
                            : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          isLastQuestion ? 'Finish' : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 180),
                  InkWell(
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.translate,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              // Container(
              //   decoration: isCorrect != null && isCorrect!
              //       ? BoxDecoration(
              //     border: Border.all(color: Colors.black87, width: 8),
              //     borderRadius: BorderRadius.circular(4),
              //   )
              //       : null,
              //   child: Text(
              //     isCorrect == null
              //         ? ''
              //         : isCorrect!
              //         ? ' You Got It Right! '
              //         : 'Incorrect answer. The correct answer is: ${quizquestion.correctAnswer}',
              //     style: TextStyle(
              //       color: isCorrect == null
              //           ? Colors.black54
              //           : (isCorrect! ? Colors.black87 : Colors.red),
              //       fontWeight: FontWeight.bold, fontSize: 28
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
