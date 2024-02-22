import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flip_card/flip_card.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:op_games/operator.dart';
import 'flash_card_info.dart';

class FlashCard extends StatefulWidget {
  FlashCard({Key? key}) : super(key: key);

  @override
  _FlashCardState createState() => _FlashCardState();
}
enum Language {
  English,
  Spanish,
}

class _FlashCardState extends State<FlashCard> {
  FlutterTts flutterTts = FlutterTts();
  int currentCardIndex = 0;
  var currentLanguage= Language.English;


  List<Map<String, dynamic>> flashCards = [
    {
      "op_name": "Plus",
      "op_sign": "+",
      "op_def": "plus is total that we get on adding two or more numbers",
      'fst_num': 5,
      'snd_num': 6
    },
    {
      "op_name": "Psdflus",
      "op_sign": "+",
      "op_def": "plus is total that we get on adding two or more numbers",
      'fst_num': 5,
      'snd_num': 6
    },
    {
      "op_name": "Psdfdlus",
      "op_sign": "+",
      "op_def": "plus is total that we get on adding two or more numbers",
      'fst_num': 5,
      'snd_num': 6
    },
    {
      "op_name": "ksdhsdk",
      "op_sign": "+",
      "op_def": "plus is total that we get on adding two or more numbers",
      'fst_num': 5,
      'snd_num': 6
    },
    // Add more flash card data as needed
  ];

  Future<void> ReadOut(String text) async {
    await flutterTts.setLanguage(currentLanguage == Language.English ? 'en-US' : 'es-ES');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

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
              Container(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                width: 1800,
                height: 600,
                child: _renderFlashCard(flashCards[currentCardIndex]),
              ),
              Row(
                children: [
                  SizedBox(width: 150),
                  InkWell(
                    onTap: () {
                      _navigateToCard(-1);
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
                          Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 600),
                  InkWell(
                    onTap: () {
                      _navigateToCard(1);
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
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderFlashCard(data ) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        top: 20.0,
        bottom: 0.0,
      ),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data["op_sign"],
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  height: 0.8,
                ),
              ),
              Text(
                data["op_name"],
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              Text(
                data["op_def"],
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 80),
              Row(
                children: [
                  SizedBox(width: 350),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPage()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.translate,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 200),
                  InkWell(
                    onTap: () {
                      ReadOut(data['op_def']);
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.volume_up,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        back: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlashCardInfo(data["op_sign"], 5, 6),
              SizedBox(height: 80),
              Row(
                children: [
                  SizedBox(width: 350),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPage()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.translate,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 200),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPage()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.volume_up,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCard(int direction) {
    int newIndex = currentCardIndex + direction;
    if (newIndex >= 0 && newIndex < flashCards.length) {
      setState(() {
        currentCardIndex = newIndex;
      });
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage()));
    }
  }
}

