import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:op_games/quiz_section/Play_Page.dart';
import 'dart:math';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int currentQuestionIndex = 0;
  Language selectedLanguage = Language.English;
  late FlutterTts flutterTts;
  bool isLastQuestion = false;
  bool optionSelected = false;
  bool questionAnswered = false; // Tracks if the current question has been answered
  String? selectedOption; // Tracks the selected option

  List<Question> questions = [
    Question(
      questionText: 'How many oranges are there?',
      options: [
        'Four',
        'Three',
        'Five',
        'Two',
      ],
      correctAnswer: 'Four',
      numberOfOranges: 4,
      orangeSets: [2, 2],
      operation: Operation.Addition,
    ),
    Question(
      questionText: 'How many oranges are there?',
      options: [
        'Two',
        'Three',
        'Four',
        'Five',
      ],
      correctAnswer: 'Two',
      numberOfOranges: 2,
      orangeSets: [1, 1],
      operation: Operation.Addition,
    ),
    Question(
      questionText: 'How many oranges are there?',
      options: [
        'Three',
        'Six',
        'Four',
        'Eight',
      ],
      correctAnswer: 'Eight',
      numberOfOranges: 8,
      orangeSets: [4, 4],
      operation: Operation.Addition,
    ),
    Question(
      questionText: 'Select the correct option:',
      options: [
        '2 oranges + 3 oranges = 5 oranges',
        '3 oranges + 2 oranges = 4 oranges',
        '4 oranges + 1 orange = 5 oranges',
        '2 oranges + 4 oranges = 6 oranges'
      ],
      correctAnswer: '2 oranges + 3 oranges = 5 oranges',
      numberOfOranges: 5,
      orangeSets: [2, 3],
      operation: Operation.Addition,
    ),
    Question(
      questionText: 'How many oranges are left?',
      options: [
        'Two',
        'Three',
        'One',
        'None',
      ],
      correctAnswer: 'Two',
      numberOfOranges: 2,
      orangeSets: [4, 2],
      operation: Operation.Subtraction,
    ),
    Question(
      questionText: 'How many oranges are left?',
      options: [
        'One',
        'Two',
        'Three',
        'None',
      ],
      correctAnswer: 'Three',
      numberOfOranges: 3,
      orangeSets: [5, 2],
      operation: Operation.Subtraction,
    ),
    Question(
      questionText: 'Select the correct option:',
      options: [
        '4 oranges - 2 oranges = 2 oranges',
        '5 oranges - 3 oranges = 2 orange',
        '6 oranges - 4 oranges = 3 oranges',
        '7 oranges - 5 oranges = 2 oranges'
      ],
      correctAnswer: '5 oranges - 3 oranges = 2 orange',
      numberOfOranges: 2,
      orangeSets: [5, 3],
      operation: Operation.Subtraction,
    ),
  ];

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> speakQuestion(String text) async {
    await flutterTts.setLanguage(
        selectedLanguage == Language.English ? 'en-US' : 'es-ES');
    await flutterTts.setSpeechRate(0.35);
    await flutterTts.speak(text);
  }

  void checkAnswer(String selectedAnswer) {
    setState(() {
      selectedOption = selectedAnswer;
      questionAnswered = true; // Mark the question as answered
      optionSelected = true;
      if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
        score = (score + 15).clamp(0, 100);
      } else {
        score = (score - 5).clamp(0, 100);
      }
      // Automatically move to the next question or show the back button if it's the last question
      if (currentQuestionIndex < questions.length - 1) {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            currentQuestionIndex++;
            questionAnswered = false;
            selectedOption = null;
          });
        });
      } else {
        isLastQuestion = true;
      }
    });
  }

  String getQuestionText() {
    if (selectedLanguage == Language.English) {
      return questions[currentQuestionIndex].questionText;
    } else {
      return questions[currentQuestionIndex].questionText
          .replaceAll('How many oranges are there?', '¿Cuántas naranjas hay?')
          .replaceAll(
          'Select the correct option:', 'Seleccione la opción correcta:')
          .replaceAll(
          'How many oranges are left?', '¿Cuántas naranjas quedan?');
    }
  }

  String getOptionText(String option) {
    return selectedLanguage == Language.English
        ? option
        : option; // Translate to Spanish or other languages
  }

  void toggleLanguage() {
    setState(() {
      selectedLanguage =
      selectedLanguage == Language.English ? Language.Spanish : Language
          .English;
    });
  }

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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CommonDesign.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              if (questions[currentQuestionIndex].operation ==
                  Operation.Addition)
                OrangesDisplay(
                  firstSetOfOranges: questions[currentQuestionIndex]
                      .orangeSets[0],
                  secondSetOfOranges: questions[currentQuestionIndex]
                      .orangeSets[1],
                ),
              if (questions[currentQuestionIndex].operation ==
                  Operation.Subtraction)
                SubtractionVisual(
                  minuend: questions[currentQuestionIndex].orangeSets[0],
                  subtrahend: questions[currentQuestionIndex].orangeSets[1],
                ),
              SizedBox(height: 20),
              Text(
                getQuestionText(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: questions[currentQuestionIndex].options.map((option) {
                  return Container(
                    width: 600,
                    margin: EdgeInsets.only(bottom: 8),
                    // Add some spacing between buttons
                    child: ElevatedButton(
                      onPressed: !questionAnswered
                          ? () => checkAnswer(option)
                          : null,
                      child: Text(
                        getOptionText(option),
                        style: TextStyle(color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<
                            Color>((states) {
                          // Change the color based on the answer status
                          if (!questionAnswered) return Colors
                              .white54; // Default color before selection
                          if (option == selectedOption && option !=
                              questions[currentQuestionIndex].correctAnswer)
                            return Colors.redAccent; // Wrong answer
                          if (option ==
                              questions[currentQuestionIndex].correctAnswer)
                            return Colors.greenAccent; // Correct answer
                          return Colors
                              .white54; // Default color for unselected options
                        }),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Score: $score',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              if (isLastQuestion && questionAnswered) // This checks if it's the last question and it has been answered
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlayPage())); // Use pushReplacement to prevent going back to the quiz
                    },
                    child: Text('Back to Levels', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Corrected from 'primary' to 'backgroundColor'
                      foregroundColor: Colors.white, // Text color remains the same
                    ),
                  ),
                ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      speakQuestion(getQuestionText());
                    },
                    child: Icon(Icons.volume_up, size: 40),
                  ),
                  SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: toggleLanguage,
                    child: Icon(Icons.g_translate_sharp, size: 40),
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

  class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final int numberOfOranges;
  final List<int> orangeSets;
  final Operation operation;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.numberOfOranges,
    required this.orangeSets,
    required this.operation,
  });
}

class OrangesDisplay extends StatelessWidget {
  final int firstSetOfOranges;
  final int secondSetOfOranges;

  const OrangesDisplay({Key? key, required this.firstSetOfOranges, required this.secondSetOfOranges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Oranges(count: firstSetOfOranges),
        SizedBox(width: 10), // Add some space between sets of oranges
        Icon(Icons.add, size: 40, color: Colors.green), // Plus sign
        SizedBox(width: 10), // Add some space between plus sign and second set of oranges
        _Oranges(count: secondSetOfOranges),
      ],
    );
  }
}

class SubtractionVisual extends StatelessWidget {
  final int minuend;
  final int subtrahend;

  const SubtractionVisual({Key? key, required this.minuend, required this.subtrahend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Oranges(count: minuend),
        SizedBox(width: 10), // Add some space between minuend and minus sign
        Icon(Icons.remove, size: 40, color: Colors.red), // Minus sign
        SizedBox(width: 10), // Add some space between minus sign and subtrahend
        _Oranges(count: subtrahend),
        SizedBox(width: 10), // Add some space between subtrahend and equal sign
        Text('=', style: TextStyle(fontSize: 40)),
        SizedBox(width: 10), // Add some space between equal sign and result
        // Text((minuend - subtrahend).toString(), style: TextStyle(fontSize: 40)),
        Text(' ? ', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _Oranges extends StatelessWidget {
  final int count;

  const _Oranges({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        count,
            (index) => index == count - 1 ? _Orange() : _OrangeWithSpacing(),
      ),
    );
  }
}

class _Orange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        'assets/orange.png',
        width: 60,
        height: 60,
      ),
    );
  }
}

class _OrangeWithSpacing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Orange(),
        SizedBox(width: 10), // Add some space between oranges
      ],
    );
  }
}

class CommonDesign {
  static const String backgroundImage = 'assets/background.png';
  static const Color primaryColor = Colors.white; // Change as needed
}

enum Language {
  English,
  Spanish,
}

enum Operation {
  Addition,
  Subtraction,
}


