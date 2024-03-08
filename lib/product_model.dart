/// [Product] model that represent the data for a product
class Product {
  /// [Product] constructor
  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.points,
  });

  /// [String] Image (required): Product image url
  final String image;

  /// [String] name (required): Product name to show
  final String name;

  /// [String] price (required): Product price to show
  final String price;

  /// [int] points (required): Product points to earn
  final int points;
}
