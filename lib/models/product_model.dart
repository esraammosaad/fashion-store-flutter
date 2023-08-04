class ProductModel {
  final String title;
  final String image;
  final String details;
  final double price;
  final String id;
  bool? isFavorite;
  final String? mainCategory;
  final String category;
  String size;
  int numberOfItem;
  ProductModel(
      {required this.image,
      required this.details,
      required this.price,
      required this.id,
      this.isFavorite = false,
      required this.category,
      this.mainCategory,
      required this.size,
      required this.numberOfItem,
      required this.title});
  factory ProductModel.fromJson(json) => ProductModel(
      image: json['image'],
      details: json['details'],
      price: json['price'],
      id: json['id'],
      isFavorite: json['isFavorite'],
      category: json['category'],
      mainCategory: json['mainCategory'],
      size: json['size'],
      numberOfItem: json['numberOfItem'],
      title: json['title']);
  Map<String, dynamic> toJson() => {
        'image': image,
        'details': details,
        'price': price,
        'id': id,
        'isFavorite': isFavorite,
        'category': category,
        'mainCategory': mainCategory,
        'size': size,
        'numberOfItem': numberOfItem,
    'title':title,
      };
}
