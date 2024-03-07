import 'package:flutter/material.dart';
import 'package:op_games/OpMatchGame.dart';
import 'package:op_games/Quiz_page.dart';
import 'package:op_games/level2_quiz_screen.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text('LEVELS',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  SizedBox(height: 70),
                  Row(
                      children :[
                        SizedBox(width: 70),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorsMatchingGamePage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 0',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 1',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PlayScreen()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 2',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 3',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 4',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 5',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 70),
                  Row(
                      children :[
                        SizedBox(width: 70),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 6',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 7',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 8',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 9',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 10',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('LVL 11',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ],
              )
          )
      ),

    );
  }


  // {
  //   return Scaffold(
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       foregroundColor: Colors.black,
  //       backgroundColor: Colors.lightBlue,
  //       shape: CircleBorder(),
  //
  //       child: const Icon(Icons.arrow_back_ios),
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
  //     body: Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: AssetImage('assets/home_screen.png'),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       child: Center(
  //         child: Padding(
  //           padding: const EdgeInsets.all(160.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               levelCard(
  //                   context, 'Level 0 -   Basic Match Game ', Icons.looks_one,
  //                   OperatorsMatchingGamePage()),
  //               levelCard(
  //                   context, 'Level 1 -   Quiz ', Icons.looks_two, QuizPage()),
  //               levelCard(
  //                   context, 'Level 2 -   Fill the literals ', Icons.looks_3,
  //                   PlayScreen()),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }


  Widget levelCard(BuildContext context, String level, IconData icon,
      Widget nextPage) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => nextPage));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          // Adjusted for consistent padding
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align text to the start
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the icon and text horizontally
                children: [
                  Icon(icon, size: 50, color: Colors.white),
                  SizedBox(width: 10),
                  // Reduce space to bring text closer to the icon
                  Expanded( // Wrap Text in Expanded to prevent overflow
                    child: Text(
                      level,
                      style: TextStyle(fontSize: 34,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Playful',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}