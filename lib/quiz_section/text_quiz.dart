import 'package:flutter/material.dart';
import 'package:op_games/common/question_data/gen_text_questions.dart';
import 'package:op_games/common/question_data/text_question.dart';
// import 'package:op_games/common/widgets/next_button.dart';

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

  TextEditingController textEditingController = TextEditingController();
  late List<TextQuestion> questions;
  @override
  void initState() {
    super.initState();

    questions = getTextQuestions(widget.opSign);

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
    if (selectedAnswer?.toLowerCase() == currQuestion.answer.toLowerCase()) {
      setState(() {
        isCorrect = true;
        isAnswerSubmitted = true; // Set answer submitted status to true
      });
    } else {
      setState(() {
        isCorrect = false;
        submissionAttempts++;
        if (submissionAttempts >= 3) {
          isAnswerSubmitted = true; // Set answer submitted status to true
        }
      });
    }
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
                child: Text(
                  quizquestion.question,
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
                  hintText: 'Enter your Answer in words...',
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
                  SizedBox(width: 40),
                  InkWell(
                    onTap: selectedAnswer != null && !isAnswerSubmitted
                        ? submitAnswer
                        : null,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 200,
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
                  SizedBox(width: 40),
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
                      width: 200,
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

// import 'package:flutter/material.dart';
// import 'package:op_games/common/question_data/gen_text_questions.dart';
// import 'package:number_to_words_english/number_to_words_english.dart';
// import 'package:op_games/common/question_data/text_question.dart';
//
// class TextQuiz extends StatefulWidget {
//   final String opSign;
//
//   const TextQuiz({Key? key, required this.opSign}) : super(key: key);
//
//   @override
//   State<TextQuiz> createState() => _TextQuizState();
// }
//
// class _TextQuizState extends State<TextQuiz> {
//   String? selectedAnswer;
//   int questionIndex = 0;
//   bool? isCorrect;
//   bool isAnswerSubmitted = false;
//   int submissionAttempts = 0;
//   TextEditingController textEditingController = TextEditingController();
//   late List<TextQuestion> questions;
//   bool quizHasEnded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     questions = getTextQuestions(widget.opSign, hard: true);
//   }
//
//   void submitAnswer() {
//     if (isAnswerSubmitted || selectedAnswer == null) {
//       return;
//     }
//     final currQuestion = questions[questionIndex];
//     setState(() {
//       isCorrect = selectedAnswer?.toLowerCase() == currQuestion.answer.toLowerCase();
//       submissionAttempts++;
//       if (isCorrect! || submissionAttempts >= 3) {
//         isAnswerSubmitted = true;
//         if (questionIndex == questions.length - 1) {
//           quizHasEnded = true;
//         }
//       } else {
//         isAnswerSubmitted = false;
//       }
//     });
//   }
//
//   void gotoNextQuestion() {
//     if (!isAnswerSubmitted) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please submit your answer first.')));
//       return;
//     }
//     if (!quizHasEnded) {
//       setState(() {
//         questionIndex++;
//         resetQuestionState();
//       });
//     }
//   }
//
//   void resetQuestionState() {
//     selectedAnswer = null;
//     isCorrect = null;
//     isAnswerSubmitted = false;
//     submissionAttempts = 0;
//     textEditingController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final quizQuestion = questions[questionIndex];
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.lightBlue,
//         shape: CircleBorder(),
//
//         child: const Icon(Icons.arrow_back_ios),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Question ${questionIndex + 1}',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 quizQuestion.question,
//                 style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 40),
//               TextField(
//                 controller: textEditingController,
//                 style: TextStyle(fontSize: 30),
//                 onChanged: (value) => selectedAnswer = value,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your answer here',
//                   labelStyle: TextStyle(fontSize: 24),
//                   border: OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
//                   suffixIcon: isCorrect == true
//                       ? Icon(Icons.check_circle, color: Colors.green, size: 30)
//                       : isCorrect == false
//                       ? Icon(Icons.cancel, color: Colors.red, size: 30)
//                       : null,
//                 ),
//                 minLines: 1,
//                 maxLines: 2,
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: isAnswerSubmitted ? null : submitAnswer,
//                 child: Text('Submit', style: TextStyle(fontSize: 24)),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                 ),
//               ),
//               SizedBox(height: 20),
//               if (!quizHasEnded && isAnswerSubmitted)
//                 TextButton(
//                   onPressed: gotoNextQuestion,
//                   child: Text('Next Question', style: TextStyle(fontSize: 24)),
//                 ),
//               if (quizHasEnded)
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text('Back to Levels', style: TextStyle(fontSize: 24)),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
