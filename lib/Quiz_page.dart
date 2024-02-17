import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CommonDesign {
  static const String backgroundImage = 'assets/home_screen.png';
  static const Color primaryColor = Colors.white; // Change as needed
}

enum Language {
  English,
  Spanish,
}

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

  List<Question> questions = [
    Question(
      questionText: 'How many oranges are there?',
      options: ['4', '3', '5', '2'],
      correctAnswer: '4',
      numberOfOranges: 4,
    ),
    Question(
      questionText: 'How many oranges are there?',
      options: ['2', '3', '4', '5'],
      correctAnswer: '2',
      numberOfOranges: 2,
    ),
    Question(
      questionText: 'How many oranges are there?',
      options: ['3', '6', '4', '8'],
      correctAnswer: '4',
      numberOfOranges: 4,
    ),
  ];

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> speakQuestion(String text) async {
    await flutterTts.setLanguage(selectedLanguage == Language.English ? 'en-US' : 'es-ES');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex].correctAnswer;
    setState(() {
      if (selectedAnswer == correctAnswer) {
        score = (score + 10).clamp(0, 100);
      } else {
        showCorrectAnswerDialog(correctAnswer);
        score = (score - 5).clamp(0, 100);
      }
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
      }
    });
  }

  void showCorrectAnswerDialog(String correctAnswer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Wrong Answer'),
        content: Text('The correct answer is $correctAnswer.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  String getQuestionText() {
    return selectedLanguage == Language.English
        ? questions[currentQuestionIndex].questionText
        : '¿Cuántas naranjas hay?'; // Translate to Spanish or other languages
  }

  String getOptionText(String option) {
    return selectedLanguage == Language.English
        ? option
        : option; // Translate to Spanish or other languages
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        actions: [
          DropdownButton<Language>(
            value: selectedLanguage,
            onChanged: (Language? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedLanguage = newValue;
                });
              }
            },
            items: Language.values.map<DropdownMenuItem<Language>>((lang) {
              return DropdownMenuItem<Language>(
                value: lang,
                child: Text(lang == Language.English ? 'English' : 'Spanish'),
              );
            }).toList(),
          ),
          IconButton(
            onPressed: () {
              speakQuestion(getQuestionText());
            },
            icon: Icon(Icons.volume_up),
          ),
        ],
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
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  questions[currentQuestionIndex].numberOfOranges,
                      (index) => Image.asset(
                    'assets/orange.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                getQuestionText(),
                style: TextStyle(
                  color: CommonDesign.primaryColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: questions[currentQuestionIndex].options.map((option) {
                  return ElevatedButton(
                    onPressed: () {
                      checkAnswer(option);
                    },
                    child: Text(
                      getOptionText(option),
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(CommonDesign.primaryColor),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Score: $score',
                style: TextStyle(
                  color: CommonDesign.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
  final int numberOfOranges;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.numberOfOranges,
  });
}
