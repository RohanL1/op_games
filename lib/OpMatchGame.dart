import 'package:flutter/material.dart';

class OperatorsMatchingGamePage extends StatefulWidget {
  const OperatorsMatchingGamePage({Key? key}) : super(key: key);
  @override
  _OperatorsMatchingGamePageState createState() =>
      _OperatorsMatchingGamePageState();
}

class _OperatorsMatchingGamePageState
    extends State<OperatorsMatchingGamePage> {
  String? selectedOperator;
  int score = 0;

  final Map<String, String> operators = {
    'Add': '+',
    'Subtract': '-',
    'Multiply': '*',
    'Divide': '/',
  };

  final Map<String, bool> operatorStatus = {
    'Add': false,
    'Subtract': false,
    'Multiply': false,
    'Divide': false,
  };

  void checkAnswer(String symbol) {
    if (operators[selectedOperator!] == symbol) {
      setState(() {
        score += 25;
        operatorStatus[selectedOperator!] = true;
        operatorStatus[symbol] = true;
      });
      _showSuccessAnimation();
    } else {
      setState(() {
        operatorStatus[selectedOperator!] = false;
        operatorStatus[symbol] = false;
      });
    }
  }

  void _showSuccessAnimation() {
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/despicable-me-minions.gif',
                  height: 200,
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'You got it right!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOperator = operator;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selectedOperator == operator ? Colors.blue : Colors.yellow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          operator,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSymbolButton(String symbol) {
    return GestureDetector(
      onTap: () {
        if (selectedOperator != null) {
          checkAnswer(symbol);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: operatorStatus[symbol] == true
              ? Colors.green
              : operatorStatus[symbol] == false
              ? Colors.red
              : Colors.yellow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          symbol,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operators Matching Game'),
        actions: [
          if (score >= 100)
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: operators.keys
                        .map((operator) => _buildOperatorButton(operator))
                        .toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: operators.values
                        .map((symbol) => _buildSymbolButton(symbol))
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Score: ${score > 100 ? 100 : score}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}