class FoodItem {
  final String title;
  final String category;

  FoodItem({this.title, this.category});
}

List<FoodItem> loadFoodItem() {
  var fi = <FoodItem>[
    FoodItem(title: "Back", category: "Strength"),
    FoodItem(title: "Bicep", category: "Strength"),
    FoodItem(title: "Tricep", category: "Strength"),
    FoodItem(title: "Chest", category: "Strength"),
    FoodItem(title: "Legs", category: "Strength"),
    FoodItem(title: "Abs", category: "Strength"),
  ];
}
