import 'package:flutter/material.dart';



import '../model/exercise.dart';

class ExerciseCard extends StatefulWidget {
  int index;
  int isCheck2;
  List<Exercise> exercise;

  ExerciseCard({
    super.key,
    required this.index,
    required this.isCheck2,
    required this.exercise,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCarState();
}

class _ExerciseCarState extends State<ExerciseCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: widget.isCheck2 == 1 ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.exercise[widget.index].name,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
                Row(
                  children: [
                    Chip(
                      visualDensity: const VisualDensity(horizontal: 4, vertical: 2),
                      label: Text("${widget.exercise[widget.index].weight}kg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Chip(
                        visualDensity:
                            const VisualDensity(horizontal: 4, vertical: 2),
                        label:
                            Text("${widget.exercise[widget.index].reps}tekrar"),
                      ),
                    ),
                    Chip(
                      visualDensity: const VisualDensity(horizontal: 4, vertical: 2),
                      label: Text("${widget.exercise[widget.index].sets}set"),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
