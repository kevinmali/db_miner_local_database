class category {
  var id;
  var quote;

  category({required this.quote, required this.id});

  factory category.sql({required Map data}) {
    return category(quote: data['quote'], id: data['id']);
  }
}
