class FruitModel {
  int id;
  String name;
  String image;
  String description;
  FruitModel({
    required this.id,
    this.name = "no-name",
    this.image = "no-image",
    this.description="no-description"
  });
}
