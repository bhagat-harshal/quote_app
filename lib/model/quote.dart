class Quote {
  late int index;
  late String message;

  Quote({required this.index, required this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['message'] = message;
    return data;
  }

  Quote.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message = json['message'];
  }
}
