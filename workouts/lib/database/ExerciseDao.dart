import 'package:workouts/database/database_assistant.dart';
import 'package:workouts/model/exercise.dart';

class Exercisedao {
  Future<List<Exercise>> TumEgzersiz(String TableName) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM $TableName");

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Exercise(
          id: satir["id"],
          name: satir["name"],
          weight: satir["weight"],
          reps: satir["reps"],
          sets: satir["sets"],
          isCompled: satir["isCompled"]);
    });
  }

  Future<void> exerciseadd(
    String TableName,
    String name,
    String weight,
    String reps,
    String sets,
  ) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();

    var bilgiler = Map<String, dynamic>();

    bilgiler["name"] = name;
    bilgiler["weight"] = weight;
    bilgiler["reps"] = reps;
    bilgiler["sets"] = reps;
    bilgiler["isCompled"] = 0;

    await db.insert(TableName, bilgiler);
  }

  Future<void> ExerciseDelete(String TableName,int id) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();

    await db.delete(TableName, where: "id=?", whereArgs: [id]);
  }

  Future<void> isscompled(
     String Tablename, int id, int isCompled) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();

    var bilgiler = Map<String, dynamic>();

    bilgiler["isCompled"] = isCompled;
    

    await db.update(Tablename, bilgiler, where: "id=?", whereArgs: [id]);
  }
}
