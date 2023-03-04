import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/model/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Category> _category = [
    Category(
        name: "Inspirational",
        description: "",
        filePath: "assets/resources/inspirational_quotes"),
    Category(name: "Feel Good", description: "", filePath: ""),
    Category(name: "Love", description: "", filePath: "")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(Icons.heat_pump_rounded),
            title: Text("Favorite"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text("Rate Us"),
          ),
          ListTile(
            leading: Icon(Icons.heat_pump_rounded),
            title: Text("About"),
          ),
          ListTile(
            leading: Icon(Icons.perm_contact_calendar_sharp),
            title: Text("Contact"),
          ),
        ],
      )),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "AWESOME QUOTE'S",
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 1,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _category.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.toNamed("/detail",
              arguments: {"category": _category[index].filePath},
              preventDuplicates: true),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(_category[index].name),
          ),
        ),
      ),
    );
  }
}
