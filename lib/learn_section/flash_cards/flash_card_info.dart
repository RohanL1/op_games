import 'package:flutter/material.dart';
import 'package:op_games/common/picture_form.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class FlashCardInfo extends StatelessWidget {
  final String _assetPath = "assets/orange.png";
  final int _f;
  final int _s;
  final String _sign;
  final double _size = 30;
  FlashCardInfo(this._sign, this._f, this._s);

  int get_op_result() {
    switch (_sign) {
      case '+':
        return _f + _s;
      case '-':
        return _f - _s;
      case '*':
        return _f * _s;
      case '/':
          return _f ~/ _s; // Performing integer division
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [

            Text(_f.toString() + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(_sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(_s.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text('  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(get_op_result().toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ],
        ),
        Row(
          children: [

            Text(NumberToWordsEnglish.convert(_f) + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(_sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(NumberToWordsEnglish.convert(_s),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text('  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(NumberToWordsEnglish.convert(get_op_result()),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ],
        ),
        Row(
          children: [
            PictureForm(num:_f,size:30),
            Text("  " + _sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            PictureForm(num:_s,size:30),
            Text('  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            PictureForm(num: get_op_result(),size:30),
          ],
        ),
      ]

    );
  }
}


// ImageBanner("assets/orange.png", 40, 40),