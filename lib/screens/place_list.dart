import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:where_to_go/widgets/text_box.dart';

class PlaceList extends StatefulWidget {
  const PlaceList({Key? key}) : super(key: key);

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  Widget listItem(String name, String subText) {
    return Container(
      margin: EdgeInsets.all(10),
        child: ListTile(
      title: Text(name),
      subtitle: Text(subText),
      trailing: Icon(Icons.directions),
      leading: Icon(Icons.location_city),
      tileColor: Colors.lightBlueAccent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new place")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            listItem("Velengan Hills", "3 km from here"),
            listItem("Pala lake", "10 km from here"),
            listItem("Village woods", "1.5 km from here"),
            listItem("Lake side park", "1.1 km from here"),
          ],
        ),
      ),
    );
  }
}
