import 'package:flutter/material.dart';
// import 'package:op_games/learn_section/operator.dart';
import 'package:op_games/common/widgets/answer_card.dart';
// import 'package:op_games/widgets/next_button.dart';
import 'package:op_games/common/question_data/mcq_question.dart';
import 'package:op_games/common/question_data/gen_mcq_questions.dart';
import 'package:flutter_tts/flutter_tts.dart';
import "package:op_games/common/translate/translate.dart";
import 'package:op_games/common/global.dart';
import 'package:op_games/quiz_section/result_page.dart';

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
  FlutterTts flutterTts = FlutterTts();
  int currentLanguage= 0;
  late Map<String, dynamic> pageLangData;
  late List<String> quesHeading;
  late List<String> LangKeys;
  int score = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> questionResults = [];

  @override
  void initState() {
    super.initState();
    if (widget.opSign == 'mix'){
      questions = getMixMcqQuestions(widget.opSign);
    }
    else {
      questions = getMcqQuestions(widget.opSign);
    }
    pageLangData = getMCQLanguageData(GlobalVariables.priLang, GlobalVariables.secLang);
    quesHeading = [pageLangData["ques_heading"]["pri_lang"], pageLangData["ques_heading"]["sec_lang"]];
    LangKeys = [getSpeakLangKey(GlobalVariables.priLang), getSpeakLangKey(GlobalVariables.secLang)];

    questionResults = List.generate(questions.length, (_) => {
      "question": "",
      "options": [],
      "selected_ans_index": -1, // -1 means no answer selected
      "is_right": false,
      "sign": ""
    });

  }

  void changeLang(){
    setState(() {
      currentLanguage = currentLanguage == 0 ? 1 : 0;
    });
  }

  Future<void> ReadOut(String text) async {
    await flutterTts.setLanguage(LangKeys[currentLanguage]);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  void pickAnswer(int value){
    selectedAnswerIndex = value;
    final question = questions[questionIndex];

    questionResults[questionIndex] = {
      "question": question.question[0],
      "options": question.options,
      "selected_ans_index": selectedAnswerIndex,
      "correct_ans_index":question.correctAnswerIndex,
      "is_right": selectedAnswerIndex == question.correctAnswerIndex,
      "sign": question.sign
    };
    if (selectedAnswerIndex == question.correctAnswerIndex){
      score += 2;
      correctAnswersCount++;
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
                  child: Column(
                    children: [
                      Text(
                        quesHeading[currentLanguage],
                        style: const TextStyle(
                          // backgroundColor: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        question.question[currentLanguage],
                        style: const TextStyle(
                          // backgroundColor: Colors.grey,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )

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
                        question: question.options[index][currentLanguage],
                        isSelected: selectedAnswerIndex == index,
                        selectedAnswerIndex: selectedAnswerIndex,
                        correctAnswerIndex: question.correctAnswerIndex,
                      ),
                    );
                  },
                ),
                // Next button
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ReadOut('$quesHeading[currentLanguage], ${question.question}');
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
                    SizedBox(width: 170,),
                    InkWell(
                      onTap: () {
                        //print("..Current Question Index: $questionIndex");
                        //print("..Total Questions: ${questions.length}");
                        if (questionIndex == questions.length-1 && selectedAnswerIndex != null) {
                          // print("..Navigating to results page.");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                            correctAnswersCount: correctAnswersCount,
                            totalQuestions: questions.length,
                            score: score,
                            questionResults: questionResults,
                          )));
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text( 'Next' ,
                              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 170,),
                    InkWell(
                      onTap: () {
                        changeLang();
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
              ],
            ),
          ),
        )
    );
  }
}