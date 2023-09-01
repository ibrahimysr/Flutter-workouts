class Exercise {
   int id;
  late String name;
  late String weight;
  late String reps;
  late String sets;
  int isCompled;

  Exercise(
  
      {
        this.id = 0,
        required this.name,
      required this.weight,
      required this.reps,
      required this.sets,
      this.isCompled = 0});
}
