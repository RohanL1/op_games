import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:op_games/common/image.dart';
import 'package:op_games/common/color.dart';
import 'package:op_games/learn_section/learn_main.dart';
import 'package:op_games/quiz_section/Score_page.dart';
import 'package:op_games/quiz_section/Quiz_page.dart';
import 'package:op_games/quiz_section/Play_Page.dart';
import 'package:op_games/common/widgets/user_card.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OP Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SystemNavigator.pop();
        },
        foregroundColor: Colors.black,
        backgroundColor: Colors.red,
        shape: CircleBorder(),

        child: const Icon(Icons.clear, size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
          child: Center(
            child: Column(
                children :[
                  SizedBox(height: 90),
                  UserCard(
                    username: 'John Doe',
                    avatarUrl: "assets/orange.png",
                    score: 100,
                  ),
                  ImageBanner("assets/heading.png", 350, 700),
                  SizedBox(height: 70),
                  Row(
                    children :[
                      SizedBox(width: 400),
                      InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPage()));
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PlayPage()));
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Quiz',
                                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ScorePage(),
                      //       ),
                      //     );
                      //   },
                      //   borderRadius: BorderRadius.circular(30),
                      //   child: Container(
                      //     width: 200,
                      //     padding: const EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Colors.orange,
                      //     ),
                      //     child: const Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: <Widget>[
                      //         Text('Score',
                      //           style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 40),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ]
                  ),

                ]
            ),
          )
      ),
    );

  }
}





// bottomNavigationBar: BottomNavigationBar(
//   type: BottomNavigationBarType.fixed,
//   backgroundColor: Colors.black87,
//   currentIndex: 0,
//   items: [
//     BottomNavigationBarItem(
//       icon: Icon(Icons.home, color: Colors.white,),
//       label: 'Home',
//       backgroundColor: Colors.white
//     ),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.access_alarm, color: Colors.white),
//         label: 'Home'
//     ),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.access_time_filled_outlined, color: Colors.white),
//         label: 'Home',
//         backgroundColor: Colors.black38
//     ),
//   ],
// ),