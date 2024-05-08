import 'package:flutter/material.dart';
import 'package:op_games/quiz_section/single_question_details.dart';

class DetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> questionResults;

  const DetailsPage({Key? key, required this.questionResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max, // Ensures it occupies all available space
            children: [
              Expanded( // Makes the ListView take all the space minus AppBar and padding
                child: ListView.builder(
                  itemCount: questionResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> question = questionResults[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // Rounded corners
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8), // Ensures the dialog doesn't take full height
            child: SingleQuestionPage(questionData: question),
          ),
        );
      },
    );
  },
                        //onPressed: () {
                         // Navigator.of(context).push(MaterialPageRoute(
                         // builder: (context) => SingleQuestionPage(questionData: question),
                        //  ));
                        //},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: question['is_right'] ? Colors.green : Colors.red,
                          minimumSize: Size(double.infinity, 50), // Ensures the button stretches to fill the width
                          padding: EdgeInsets.symmetric(vertical: 20), // Increases button height
                        ),
                        child: Text('Question ${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

