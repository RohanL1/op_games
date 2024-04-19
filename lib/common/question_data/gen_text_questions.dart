import 'package:op_games/common/question_data/text_question.dart';
import 'package:op_games/common/question_data/text_question.dart';
import 'package:op_games/common/random_num_gen.dart';
import 'package:op_games/common/comm_functions.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:op_games/common/question_data/text_question.dart';

List<TextQuestion> getTextQuestions(String sign, {bool hard = false}) {
  int numLimit = sign== '÷' ? hard ? 30 : 20 : hard ? 20 : 10;
  int totalQuestions =5;
  List<List<int>> data = [];
  for (int i = 0; i < totalQuestions; i++) {
    data.add(getRandomNumbersWithLimit(numLimit, numLimit));
  }

  List<TextQuestion> questions = [];

  for (int i = 0; i < data.length; i++) {
    int res = get_op_result(sign, data[i][0], data[i][1]);
    String questionText = '${data[i][0]} $sign ${data[i][1]}';
    if (i>1) {
      questionText = '${NumberToWordsEnglish.convert(data[i][0])} $sign ${NumberToWordsEnglish.convert(data[i][1])}';
    }



    questions.add(
      TextQuestion(
        question: questionText,
        answer: NumberToWordsEnglish.convert(res),
      ),
    );
  }

  return questions;
}

List<TextQuestion> getMixTextQuestions(String sign, {bool hard = false}) {

  List<String> signs = ['+', '-', 'x', '÷'];
  int cnt = 0;
  int currentSignIdx = 0;
  int numLimit = 20;
  int totalQuestions = 20;
  int numQuesLim = 2;
  numQuesLim -= 1;

  List<List<int>> data = [];

  for (int i = 0; i < totalQuestions; i++) {
    data.add(getRandomNumbersWithLimit(numLimit, numLimit));
  }

  List<TextQuestion> questions = [];

  for (int i = 0; i < data.length; i++) {
    int res = get_op_result(signs[currentSignIdx], data[i][0], data[i][1]);
    String questionText = '${data[i][0]} ${signs[currentSignIdx]} ${data[i][1]}';
    if (cnt>numQuesLim) {
      questionText = '${NumberToWordsEnglish.convert(data[i][0])} ${signs[currentSignIdx]} ${NumberToWordsEnglish.convert(data[i][1])}';
    }
    questions.add(
      TextQuestion(
        question: questionText,
        answer: NumberToWordsEnglish.convert(res),
      ),
    );
    cnt += 1;
    if (cnt == 5){
      cnt = 0;
      currentSignIdx += 1;
    }
  }

  return questions;
}