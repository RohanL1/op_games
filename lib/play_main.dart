import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:op_games/image.dart';


class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home_screen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Text('Play PAGE',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),)
          )
      ),
    );
  }
}