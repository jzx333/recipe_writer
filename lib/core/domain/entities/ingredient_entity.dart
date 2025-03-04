class IngredientEntity {
  String name;
  String quantity;

  IngredientEntity({
    required this.name,
    required this.quantity,
  });

  @override
  String toString() {
    return 'IngredientEntity{name: $name, quantity: $quantity}';
  }
}