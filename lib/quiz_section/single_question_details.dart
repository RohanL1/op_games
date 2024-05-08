import 'package:flutter/material.dart';
import 'package:op_games/common/widgets/answer_card.dart'; 

class SingleQuestionPage extends StatelessWidget {
  final Map<String, dynamic> questionData;

  const SingleQuestionPage({Key? key, required this.questionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? selectedAnswerIndex = questionData['selected_ans_index'];
    int correctAnswerIndex = questionData['correct_ans_index'];
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(questionData['question'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: questionData['options'].length,
                itemBuilder: (context, index) {
                  return AnswerCard(
                    question: questionData['options'][index][0],
                    isSelected: selectedAnswerIndex == index,
                    currentIndex: index,
                    correctAnswerIndex: correctAnswerIndex,
                    selectedAnswerIndex: selectedAnswerIndex,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
