class Article {
  String id;
  String title;
  String content ;

  Article (this.id, this.title, this.content){}

  static Article fromJson(Map<String, dynamic> json) {
    return Article(json['_id'], json['title'], json['content']);
  }
}