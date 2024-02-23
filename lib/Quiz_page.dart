import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

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
  final translator = GoogleTranslator();

  List<Question> questions = [
    Question(
      questionText: 'How many oranges are there?',
      options: [
        '4',
        '3',
        '5',
        '2',
      ],
      correctAnswer: '4',

      numberOfOranges: 4,
      orangeSets: [2, 2],
    ),
    Question(
      questionText: 'How many oranges are there?',
      options: [
        '2',
        '3',
        '4',
        '5',
      ],
      correctAnswer: '2',
      numberOfOranges: 2,
      orangeSets: [1, 1],
    ),
    Question(
      questionText: 'How many oranges are there?',
      options: [
        '3',
        '6',
        '4',
        '8',
      ],
      correctAnswer: '8',
      numberOfOranges: 8,
      orangeSets: [4, 4],
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
    ),
  ];

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> _translateToSpanish(String text) async {
    Translation translation = await translator.translate(
      text,
      from: 'en',
      to: 'es',
    );
    setState(() {
      // Display the translated text or use it as needed
      print(translation.text);
    });
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
              OrangesDisplay(
                firstSetOfOranges: questions[currentQuestionIndex].orangeSets[0],
                secondSetOfOranges: questions[currentQuestionIndex].orangeSets[1],
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                speakQuestion(getQuestionText());
              },
              child: Icon(Icons.volume_up, size: 40),
            ),
            SizedBox(height: 40, width: 20),
            FloatingActionButton(
              onPressed: () {

              },
              child: Icon(Icons.g_translate_sharp, size: 40),
            ),
          ],
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

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.numberOfOranges,
    required this.orangeSets,
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
    return Image.asset(
      'assets/orange.png',
      width: 60,
      height: 60,
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
