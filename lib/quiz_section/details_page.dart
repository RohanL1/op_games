import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> questionResults;
  final String questionType;  // This parameter determines the type of questions

  const DetailsPage({
    Key? key,
    required this.questionResults,
    required this.questionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white54, Colors.black54],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: questionResults.length,
          itemBuilder: (context, index) {
            final result = questionResults[index];
            final isMCQ = questionType == 'mcq';  // Determine if the questions are MCQ based on the questionType passed
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${index + 1}: ${result['question']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    if (isMCQ) ...[
                      Text(
                        'Your Answer: ${result['options'][result['selected_ans_index']]}',
                        style: TextStyle(
                          fontSize: 16,
                          color: result['is_right'] ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        'Correct Answer: ${result['options'][result['correct_ans_index']]}',
                        style: const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text(
                        'Result: ${result['is_right'] ? 'Correct' : 'Incorrect'}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: result['is_right'] ? Colors.green : Colors.red,
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Entered Answer: ${result['enteredAnswer'] ?? "No answer submitted"}',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      Text(
                        'Correct Answer: ${result['correctAnswer']}',
                        style: const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text(
                      'Result: ${result['isCorrect'] ? 'Correct' : 'Incorrect'}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: result['isCorrect'] ? Colors.green : Colors.red,
                      ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
