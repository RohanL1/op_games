import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:op_games/flash_cards_2.dart';
import 'package:op_games/image.dart';


class FlashCard extends StatelessWidget {
  const FlashCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => PlayPage()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 900,
                      height: 500,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white70,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Text('+',
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 200),
                              ),
                              Text('PLUS',
                                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 100),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlashCardTemp()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Learn More',
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),

                ]
            ),
          )
      ),
    );

  }
}