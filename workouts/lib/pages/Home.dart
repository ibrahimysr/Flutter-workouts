import 'package:flutter/material.dart';
import 'package:workouts/ui/colorshema.dart';
import 'package:workouts/widgets/CategoryCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorSheme get _colorshemes => ColorSheme.instance;
  List<String> kategoriler = [
    "Göğüs",
    "Sırt",
    "Kol",
    "Bacak",
    "Omuz",
    "Karın",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoriler"),
      ),
      body: ListView.builder(
        itemCount: kategoriler.length,
        itemBuilder: (context, index) => CategoryCard(
          colorshemes: _colorshemes,
          kategoriler: kategoriler,
          title: kategoriler[index],
        ),
      ),
    );
  }
}
