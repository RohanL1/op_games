import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:op_games/image.dart';


class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

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
              children: [
                SizedBox(height: 100),
                Text('Operator List',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
                ),
                SizedBox(height: 70),
                Row(
                    children :[
                      SizedBox(width: 250),
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPage()));
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('+',
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      InkWell(
                        onTap: () {

                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('-',
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      InkWell(
                        onTap: () {SystemNavigator.pop();},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('X',
                                style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 100),
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
}