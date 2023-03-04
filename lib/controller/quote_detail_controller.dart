import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quote_app/model/quote.dart';

class QuoteDetailController extends GetxController {
  final quotes = <Quote>[].obs;

  Future<List<Quote>> loadQuotes(String filePath) async {
    if (kDebugMode) {
      print("loadQuotes called.");
    }

    // Fetch data.
    List<Quote> list = [];
    var data = await rootBundle.loadString(filePath);
    var jsonResult = jsonDecode(data);
    jsonResult.forEach((element) => list.add(Quote.fromJson(element)));

    // Assign data.
    quotes.value = list;

    return list;
  }
}
