import 'package:flutter/material.dart';
import 'package:workouts/pages/TimeHome.dart';

import '../widgets/NumberPro.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  int toplam = 0;
  int selectedHoursIndex = 0;
  int selectedMinutesIndex = 0;
  int selectedSecondsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ZAMANLAYICI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //HOURS
                SizedBox(
                  height: 175,
                  width: 80,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.01,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return NumberPro(index);
                      },
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedHoursIndex = index;
                        toplam = (selectedHoursIndex * 3600) +
                            (selectedMinutesIndex * 60) +
                            selectedSecondsIndex;
                      });
                    },
                  ),
                ),
                //MUNİTE
                SizedBox(
                  height: 175,
                  width: 80,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.01,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return NumberPro(index);
                      },
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMinutesIndex = index;
                        toplam = (selectedHoursIndex * 3600) +
                            (selectedMinutesIndex * 60) +
                            selectedSecondsIndex;
                      });
                    },
                  ),
                ),
                //SECOND
                SizedBox(
                  height: 160,
                  width: 80,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.01,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return NumberPro(index);
                      },
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedSecondsIndex = index;
                        toplam = (selectedHoursIndex * 3600) +
                            (selectedMinutesIndex * 60) +
                            selectedSecondsIndex;
                      });
                    },
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimeHome(toplam),
                  ),
                );
              },
              child: const Icon(
                Icons.play_arrow,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
