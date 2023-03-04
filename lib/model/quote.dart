class Quote {
  late int index;
  late String message;
  late String category;
  late bool isLike;

  Quote(
      {required this.index,
      required this.message,
      required this.category,
      required this.isLike});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['message'] = message;
    data['category'] = category;
    data['isLike'] = isLike;
    return data;
  }

  Quote.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message = json['message'];
    category = json['category'];
    isLike = json['isLike'];
  }
}
