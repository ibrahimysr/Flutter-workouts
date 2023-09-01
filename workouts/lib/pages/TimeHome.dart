import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimeHome extends StatefulWidget {
  int? toplam;
  TimeHome(this.toplam, {Key? key}) : super(key: key);

  @override
  State<TimeHome> createState() => _TimeHomeState();
}

class _TimeHomeState extends State<TimeHome> {
  Timer? timer;
  double _percent = 1.0;
  int _secondsRemaining = 0;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.toplam!;
  }

  void start() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_secondsRemaining == 0) {
          timer?.cancel();
        } else {
          _secondsRemaining--;
          _percent = _secondsRemaining / (widget.toplam!);
        }
      });
    });
    setState(() {
      _started = true;
    });
  }

  void pause() {
    timer?.cancel();
    setState(() {
      _started = false;
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                (_started) ? pause() : start();
              },
              child: CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 10.0,
                  animation: false,
                  percent: _percent,
                  center: Text(
                    _formatTime(_secondsRemaining),
                    style: const TextStyle(color: Colors.white, fontSize: 53),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.black,
                  backgroundColor: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        (_started) ? pause() : start();
                      },
                      child: _started
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.skip_next_sharp)),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Geri",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
