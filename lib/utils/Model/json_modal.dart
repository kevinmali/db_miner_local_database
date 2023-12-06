class allcategory {
  var category;
  var quote;
  var id;
  var author;
  var favorite;

  allcategory(
      {required this.quote,
      required this.id,
      required this.author,
      required this.favorite,
      required this.category});

  factory allcategory.frommap({required Map data}) {
    return allcategory(
      quote: data['quote'],
      id: data['id'],
      author: data['author'],
      category: data['category'],
      favorite: data['favorite'],
    );
  }
}
