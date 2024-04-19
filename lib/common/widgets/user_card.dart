import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final int score;

  const UserCard({
    Key? key,
    required this.username,
    required this.avatarUrl,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(avatarUrl),
            radius: 20,
          ),
        ),
        SizedBox(width: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(width: 700),
            Text(
              'Score: $score',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
