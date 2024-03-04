class Category {
  String quote;
  dynamic id;

  Category({required this.quote, required this.id});

  factory Category.sql({required Map data}) {
    return Category(quote: data['quote'], id: data['id']);
  }
}
