import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(height: 350.0, width: 700),
        // decoration: BoxDecoration(color: Colors.transparent),
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ));
  }
}