import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import '../model/quote.dart';


class QuoteDetailProvider extends ChangeNotifier {
  List<Quote> _quotes = [];
  List<Quote> get quotes => _quotes;

  // load() {
  //   loadQuotes("fileName")
  //       .then((value) => _quotes = value)
  //       .whenComplete(() => notifyListeners());
  // }

  Future loadQuotes(String filePath) async {

     if (kDebugMode) {
      print("loadQuotes called.");
    }

    // Fetch data.
    List<Quote> list = [];
    var data = await rootBundle.loadString(filePath);
    var jsonResult = jsonDecode(data);
    jsonResult.forEach((element) => list.add(Quote.fromJson(element)));

   
    // Assign data.
    _quotes = list;

   

    return quotes;
  }
}
