import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/quote_detail_controller.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final QuoteDetailController quoteDetailController =
      Get.put(QuoteDetailController());

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String filePath = routes["category"];

    quoteDetailController.loadQuotes(filePath);

    return Scaffold(
      body: GetX<QuoteDetailController>(builder: (controller) {
        if (kDebugMode) {
          print("quote count -> ${controller.quotes.length}");
        }
        return PageView.builder(
            itemCount: controller.quotes.length,
            itemBuilder: (context, index) {
              return SafeArea(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.quotes[index].message,
                            style: const TextStyle(fontSize: 35),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(onPressed: (){}, child: new Text("save"))
                        ],
                      )));
            });
      }),
    );
  }
}
