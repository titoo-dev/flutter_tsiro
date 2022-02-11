class Recipe {
  String id;
  String name;
  int rate;
  String time;
  int makes;
  String level;
  String description;
  List<String> ingredients;
  List<String> direction;
  List<String> imagesPath;
  String video;
  String totalTime;
  String preparationTime;
  String cookingTime;
  

  Recipe({
    this.id,
    this.description,
    this.direction,
    this.ingredients,
    this.makes,
    this.name,
    this.rate,
    this.time,
    this.imagesPath,
    this.level,
    this.video,
    this.totalTime,
    this.preparationTime
  });
}