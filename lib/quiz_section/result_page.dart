import 'package:flutter/material.dart';
import 'package:op_games/quiz_section/details_page.dart';

class ResultsPage extends StatelessWidget {
  final int correctAnswersCount;
  final int totalQuestions;
  final int score;
  final List<Map<String, dynamic>> questionResults; 

  const ResultsPage({
    Key? key,
    required this.correctAnswersCount,
    required this.totalQuestions,
    required this.score,
    required this.questionResults,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Similar to lightBlue used in FlashCard
        title: const Text("Level Results"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Assuming you have a similar background
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5, // Adding some elevation for shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.white70, // Taken from the FlashCard back card
              child: Padding(
                padding: const EdgeInsets.all(50.0), // From FlashCard back padding
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Total Questions: $totalQuestions", style: TextStyle(fontSize: 24, color: Colors.black87)),
                    SizedBox(height: 10),
                    Text("Correct Answers: $correctAnswersCount", style: TextStyle(fontSize: 24, color: Colors.black87)),
                    SizedBox(height: 10),
                    Text("Your Score: $score", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, 
                        foregroundColor: Colors.white, 
                        textStyle: TextStyle(fontSize: 20),
                        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      ),
                      child: Text("Back to Home", style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsPage(questionResults: questionResults),),);        
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal, 
                            foregroundColor: Colors.white, 
                            textStyle: TextStyle(fontSize: 20),
                            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                          ),
                          child: Text("Details", style: TextStyle(fontSize: 20)),
                        ),
                    // Add the "Details" button or other UI elements as needed
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
