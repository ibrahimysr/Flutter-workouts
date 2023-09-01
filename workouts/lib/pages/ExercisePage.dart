import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:workouts/database/ExerciseDao.dart';

import 'package:workouts/model/exercise.dart';
import 'package:workouts/ui/colorshema.dart';
import 'package:workouts/widgets/ExerciseCard.dart';

import '../database/function.dart';
import '../widgets/Textfield.dart';

class ExercisePage extends StatefulWidget {
  String TableName;
  ExercisePage({required this.TableName, super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  ColorSheme get _colorshemes => ColorSheme.instance;

  final ExerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();

  Future<List<Exercise>> TumEgzersiz() async {
    var ExerciseList = await Exercisedao().TumEgzersiz(widget.TableName);

    return ExerciseList;
  }

  void CreateNewExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _colorshemes.siyah,
        title: const Text(
          "Yeni Egzersiz",
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Mytextfield(ExerciseNameController, "isim"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Mytextfield(weightController, "Ağırlık"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Mytextfield(repsController, "Tekrar"),
              ),
              Mytextfield(setsController, "Set"),
            ],
          ),
        ),
        actions: [
          MaterialButton(
              color: Colors.green,
              onPressed: save,
              child: const Text(
                "Kaydet",
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.red,
              onPressed: cancel,
              child: const Text(
                "Geri",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  void save() {
    Navigator.pop(context);

    setState(() {
      ekle(widget.TableName, ExerciseNameController.text, weightController.text,
          repsController.text, setsController.text);
    });

    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    ExerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  int isCheck2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => CreateNewExercise(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(widget.TableName),
        ),
        body: FutureBuilder(
          future: TumEgzersiz(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var ExerciseList = snapshot.data;
              return ListView.builder(
                  itemCount: ExerciseList!.length,
                  itemBuilder: (context, index) {
                    var exercise = ExerciseList[index];
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                          onTap: (() {
                            setState(() {
                              isCheck2 == 0 ? isCheck2 = 1 : isCheck2 = 0;
                              guncelle(widget.TableName, exercise.id, isCheck2);
                            });
                          }),
                          child: Slidable(
                            endActionPane:
                                ActionPane(motion: const StretchMotion(), children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(10),
                                onPressed: (context) {
                                  setState(() {
                                    sil(
                                      widget.TableName,
                                      exercise.id,
                                    );
                                  });
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                              )
                            ]),
                            child: ExerciseCard(
                              index: index,
                              isCheck2: exercise.isCompled,
                              exercise: ExerciseList,
                            ),
                          )),
                    );
                  });
            }

            return const Center(child: Text("Henüz Kaydettiğiniz Bir Exercise Yok"));
          },
        ));
  }
}
