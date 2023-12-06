class allcategory {
  var category_image;
  var category_id;
  var quotes_category;
  var category_icon;
  List quotes;

  allcategory(
      {required this.category_id,
      required this.quotes_category,
      required this.category_icon,
      required this.quotes,
      required this.category_image});

  factory allcategory.frommap({required Map data}) {
    return allcategory(
      category_id: data['category-id'],
      quotes_category: data['quotes-category'],
      category_icon: data['category-icon'],
      category_image: data['category-image'],
      quotes: data['quotes'],
    );
  }
}
