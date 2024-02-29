import 'package:flutter/material.dart';
import 'package:op_games/question_data/quiz_question.dart';
import 'package:op_games/question_data/quiz_questions.dart';
import 'package:op_games/widgets/next_button.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  String? selectedAnswer;
  int questionIndex = 0;
  bool? isCorrect;
  bool isAnswerSubmitted = false;
  int submissionAttempts = 0;
  String feedbackMessage = '';

  TextEditingController textEditingController = TextEditingController();

  void pickAnswer(String value) {
    selectedAnswer = value;
    setState(() {
      isCorrect = null; // Reset correctness feedback
      isAnswerSubmitted = false; // Reset answer submitted status
    });
  }

  void submitAnswer() {
    final quizquestion = quizquestions[questionIndex];
    if (selectedAnswer == quizquestion.correctAnswer) {
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
    if (questionIndex < quizquestions.length - 1) {
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
    final quizquestion = quizquestions[questionIndex];

    bool isLastQuestion = questionIndex == quizquestions.length - 1;
    bool isFirstQuestion = questionIndex == 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${questionIndex + 1}'),
        leading: isFirstQuestion
            ? null // If it's the first question, don't show a back button
            : IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            gotoPreviousQuestion();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                  quizquestion.quizquestion,
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
                  hintText: 'Enter your Answer...',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isFirstQuestion)
                    InkWell(
                      onTap: () {
                        gotoPreviousQuestion();
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.yellow,
                        ),
                        child: Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: 40),
                  InkWell(
                    onTap: isAnswerSubmitted || selectedAnswer == null
                        ? gotoNextQuestion
                        : null,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: isAnswerSubmitted || selectedAnswer == null
                            ? Colors.green
                            : Colors.lightBlue,
                      ),
                      child: Center(
                        child: Text(
                          isLastQuestion ? 'Finish' : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: isCorrect != null && isCorrect!
                    ? BoxDecoration(
                  border: Border.all(color: Colors.black87, width: 8),
                  borderRadius: BorderRadius.circular(4),
                )
                    : null,
                child: Text(
                  isCorrect == null
                      ? ''
                      : isCorrect!
                      ? ' You Got It Right! '
                      : 'Incorrect answer. The correct answer is: ${quizquestion.correctAnswer}',
                  style: TextStyle(
                    color: isCorrect == null
                        ? Colors.black54
                        : (isCorrect! ? Colors.black87 : Colors.red),
                    fontWeight: FontWeight.bold, fontSize: 28
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
