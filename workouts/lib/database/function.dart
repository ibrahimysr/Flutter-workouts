  import 'ExerciseDao.dart';

Future<void> ekle(String TableName,String ExerciseName,String weight,
  String reps,String sets) async {
    await Exercisedao().exerciseadd(
        TableName,
        ExerciseName,
        weight,
        reps,
        sets);
  }

   Future<void> guncelle(String TableName,int id,int isCheck2) async {
    await Exercisedao().isscompled(TableName, id, isCheck2);
  }

    Future<void> sil(String TableName,int id) async {
    await Exercisedao().ExerciseDelete(TableName, id);
  }