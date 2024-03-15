import 'dart:math';
import 'package:op_games/common/random_num_gen.dart';
import 'package:number_to_words_english/number_to_words_english.dart';


List<Map<String, dynamic>> get_op_data(String sign){
  List<List<int>> data = [
    getRandomNumbersWithLimit(10, 10),
    getRandomNumbersWithLimit(10, 10),
    getRandomNumbersWithLimit(10, 10),
  ];
  List<Map<String, dynamic>>  result ;
  Map<String, List<Map<String, dynamic>>> flashCards  = {
     '+' : [
              {
                "op_name": "Plus",
                "op_sign": "+",
                "op_def": "plus is total that we get on adding two or more numbers",
                'fst_num': 5,
                'snd_num': 6,
              },
              {
                "op_name": data[0][0].toString() + " + " + data[0][1].toString(),
                "op_sign": "+",
                "op_def": "Guess the Answer",
                'fst_num': data[0][0],
                'snd_num': data[0][1],
              },
              {
                "op_name": NumberToWordsEnglish.convert(data[1][0]) + " + " + NumberToWordsEnglish.convert(data[1][1]),
                "op_sign": "+",
                "op_def": "Guess the Answer",
                'fst_num': data[1][0],
                'snd_num': data[1][1],
              },
     ],
     '-': [
       {
         "op_name": "Minus",
         "op_sign": "-",
         "op_def": "minus is the difference between two numbers",
         'fst_num': 10,
         'snd_num': 5,
       },
       {
         "op_name": data[0][0].toString() + " - " + data[0][1].toString(),
         "op_sign": "-",
         "op_def": "Guess the Answer",
         'fst_num': data[0][0],
         'snd_num': data[0][1],
       },
       {
         "op_name": NumberToWordsEnglish.convert(data[1][0]) + " - " + NumberToWordsEnglish.convert(data[1][1]),
         "op_sign": "-",
         "op_def": "Guess the Answer",
         'fst_num': data[1][0],
         'snd_num': data[1][1],
       },
     ],
     'x': [
       {
         "op_name": "Multiplication",
         "op_sign": "x",
         "op_def": "multiplication is the process of repeated addition",
         'fst_num': 5,
         'snd_num': 6,
       },
       {
         "op_name": data[0][0].toString() + " x " + data[0][1].toString(),
         "op_sign": "x",
         "op_def": "Guess the Answer",
         'fst_num': data[0][0],
         'snd_num': data[0][1],
       },
       {
         "op_name": NumberToWordsEnglish.convert(data[1][0]) + " x " + NumberToWordsEnglish.convert(data[1][1]),
         "op_sign": "x",
         "op_def": "Guess the Answer",
         'fst_num': data[1][0],
         'snd_num': data[1][1],
       },
     ],
     '÷': [
       {
         "op_name": "Division",
         "op_sign": "÷",
         "op_def": "division is the process of sharing or grouping a number into equal parts",
         'fst_num': 20,
         'snd_num': 5,
       },
       {
         "op_name": data[0][0].toString() + " ÷ " + data[0][1].toString(),
         "op_sign": "÷",
         "op_def": "Guess the Answer",
         'fst_num': data[0][0],
         'snd_num': data[0][1],
       },
       {
         "op_name": NumberToWordsEnglish.convert(data[1][0]) + " ÷ " + NumberToWordsEnglish.convert(data[1][1]),
         "op_sign": "÷",
         "op_def": "Guess the Answer",
         'fst_num': data[1][0],
         'snd_num': data[1][1],
       },
     ],

   };
  result = flashCards[sign]!;
  return result;
}
