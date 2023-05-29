class recipes {
  String name;
  String steps;
  String imageURL;

  recipes({
    required this.name,
    required this.steps,
    required this.imageURL,
  });

  factory recipes.fromMap({required Map data}) {
    return recipes(
        name: data['name'],
        steps: data['steps'],
        imageURL: data['imageURL']);
  }
}