import 'package:flutter/material.dart';

class CommonDesign {
  static const String backgroundImage = 'assets/home_screen.png';
  static const Color primaryColor = Colors.white; // Change as needed
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int currentQuestionIndex = 0;

  List<Question> questions = [
    Question(
      questionText: 'What is 2 + 2?',
      options: ['4', '3', '5', '2'],
      correctAnswer: '4',
      icons: [
        Icons.local_florist,
        Icons.local_florist,
        Icons.local_florist,
        Icons.local_florist,
      ],
    ),
    Question(
      questionText: 'What is 5 - 3?',
      options: ['2', '3', '4', '5'],
      correctAnswer: '2',
      icons: [
        Icons.local_florist,
        Icons.local_florist,
      ],
    ),
    Question(
      questionText: 'What is 3 * 4?',
      options: ['10', '12', '14', '8'],
      correctAnswer: '12',
      icons: [
        Icons.local_florist,
        Icons.local_florist,
        Icons.local_florist,
        Icons.local_florist,
      ],
    ),
  ];

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex].correctAnswer;
    setState(() {
      if (selectedAnswer == correctAnswer) {
        score = (score + 10).clamp(0, 100);
      } else {
        score = (score - 5).clamp(0, 100);
      }
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CommonDesign.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Score: $score',
                      style: TextStyle(
                        color: CommonDesign.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.emoji_events,
                      color: Colors.yellow,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                questions[currentQuestionIndex].questionText,
                style: TextStyle(
                  color: CommonDesign.primaryColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  questions[currentQuestionIndex].icons.length,
                      (index) => Icon(
                    questions[currentQuestionIndex].icons[index],
                    size: 50,
                    color: Colors.green, // Change color as needed
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                questions[currentQuestionIndex].options.length,
                    (index) => ElevatedButton(
                  onPressed: () {
                    checkAnswer(
                        questions[currentQuestionIndex].options[index]);
                  },
                  child: Text(
                    questions[currentQuestionIndex].options[index],
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(CommonDesign.primaryColor),
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

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final List<IconData> icons;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.icons,
  });
}
