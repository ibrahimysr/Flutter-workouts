import 'package:flutter/material.dart';
import 'package:workouts/pages/ExercisePage.dart';

import '../ui/colorshema.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({
    super.key,
    required ColorSheme colorshemes,
    required this.kategoriler,
    required this.title,
  }) : _colorshemes = colorshemes;

  final ColorSheme _colorshemes;
  final List<String> kategoriler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExercisePage(TableName: title)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
              color: _colorshemes.siyah,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/dambıl.png"),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.white,
                      size: 35,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
