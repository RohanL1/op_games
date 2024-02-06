import 'package:flutter/material.dart';
import 'package:op_games/radio.dart';

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
      appBar: AppBar(
        title: const Text('Checkbox!'),
      ),
      body: Column(
        children: [
          const Column(
            children: [
              SizedBox(height: 20),
              Text('You are this far away from exploring the whole universe:'),
              SizedBox(height: 20),
              LinearProgressIndicator(value: 0.0),
            ],
          ),
          const Column(
            children: [
              TaskItem(label: 'Load rocket with supplies'),
              TaskItem(label: 'Launch rocket'),
              TaskItem(label: 'Circle the home planet'),
              TaskItem(label: 'Head out to the first moon'),
              TaskItem(label: 'Launch moon lander #1'),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MCQPage()));
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
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 32,),
                  SizedBox(width: 15),
                  Text('MCQ',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;
  const TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _value = newValue),
          value: _value,
        ),
        Text(widget.label),
      ],
    );
  }
}

