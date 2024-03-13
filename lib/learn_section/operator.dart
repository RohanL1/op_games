import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:op_games/learn_section/flash_cards/flash_cards.dart';
import 'package:op_games/common/image.dart';
import 'package:op_games/learn_section/practice_section/practice_screen.dart';


class OperatorPage extends StatelessWidget {
  final Map<String, dynamic> operatorData;

  OperatorPage({required this.operatorData});

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
                children :[
                  SizedBox(height: 80),
                  // ImageBanner('assets/plus.png', 300, 250),
                  Text(
                    operatorData['op_sign'],
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 200,
                      height: 0.8,
                    ),
                  ),
                  Text(
                    operatorData['op_name'],
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontSize: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Row(
                  //   children: [
                  //     SizedBox(width: 35),
                  //     Text('DEFINATION : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                  //       style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(height: 80),
                  Row(
                      children :[
                        SizedBox(width: 400),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FlashCard(opSign: operatorData['op_sign'] ,)));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.lightGreen,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Learn',
                                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 100),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PracticeScreen(opSign: operatorData['op_sign'],)));
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.lightBlue,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Practice',
                                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 100),
                      ]
                  ),

                ]
            ),
          )
      ),
    );

  }
}