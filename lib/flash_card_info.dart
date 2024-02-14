import 'package:flutter/material.dart';

class FlashCardInfo extends StatelessWidget {
  final String _assetPath = "assets/orange.png";
  final int _f;
  final int _s;
  final String _sign;
  final double _size = 30;
  FlashCardInfo(this._sign, this._f, this._s);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(_f.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Row(
                children: List.generate(
                  _f,
                      (index) => Container(
                    // margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _assetPath, // Replace with your image asset path
                      width: _size,
                      height: _size,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ),
          ],
        ),
        SizedBox(width: 20),
        Text(_sign,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(_s.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Row(
                children: List.generate(
                  _s,
                      (index) => Container(
                    // margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _assetPath, // Replace with your image asset path
                      width: _size,
                      height: _size,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ),
          ],
        ),

        SizedBox(width: 20),
        Text('=',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text((_f+_s).toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Row(
                children: List.generate(
                  _f + _s,
                      (index) => Container(
                    // margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _assetPath, // Replace with your image asset path
                      width: _size,
                      height: _size,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ),
          ],
        ),
      ],
    );
  }
}


// ImageBanner("assets/orange.png", 40, 40),