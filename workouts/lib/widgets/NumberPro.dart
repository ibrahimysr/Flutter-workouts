
import 'package:flutter/material.dart';

class NumberPro extends StatelessWidget {
  int mins;
  NumberPro(this.mins, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          mins.toString().padLeft(2, "0"),
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
