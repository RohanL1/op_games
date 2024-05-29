import 'package:flutter/material.dart';
import 'package:op_games/quiz_section/single_question_details.dart';

class DetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> questionResults;
  final String questionType;
  const DetailsPage({
    Key? key,
    required this.questionResults,
    required this.questionType,
  }) : super(key: key);

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
        padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 160.0),
          child: Column(
            mainAxisSize: MainAxisSize.max, // Ensures it occupies all available space
            children: [
              Text(
                'Details',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ),
              Expanded( // Makes the ListView take all the space minus AppBar and padding
                child: ListView.builder(
                  itemCount: questionResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> question = questionResults[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)), // Rounded corners
                                    child: Container(
                                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8), // Ensures the dialog doesn't take full height
                                      child: SingleQuestionPage(questionData: question, questionType: questionType,),
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
                        child: Text('Question ${index + 1}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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

