import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:where_to_go/screens/place_list.dart';
import 'package:where_to_go/widgets/text_box.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final placeTextController = TextEditingController();
  final ratingTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new place")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextBox(
                hintText: 'place name',
                controller: placeTextController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                type: 'string'),
            Container(
              height: 20,
            ),
            TextBox(
                hintText: 'rating out of 5',
                controller: ratingTextController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rating';
                  }
                  return null;
                },
                type: 'number'),
            Container(
                padding: EdgeInsets.all(20),
                child: TextButton(onPressed: () {

                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlaceList()),
                        );
                }, child: Text("Add place")))
          ],
        ),
      ),
    );
  }
}
