class CategoryModel {
  final String img;
  final String name;

  CategoryModel({required this.img, required this.name});
}

class ProductModel {
  final String img;
  final String name;
  final String rate;
  final String price;
  final String rateCount;

  ProductModel({
    required this.img,
    required this.name,
    required this.rate,
    required this.price,
    required this.rateCount,
  });
}
