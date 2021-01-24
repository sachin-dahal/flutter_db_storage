import 'package:flutter/material.dart';
import 'package:flutter_db_storage/screens/view_data.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _bodyController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Title",
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                hintText: "Body",
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
            SizedBox(height: 40.0),
            RaisedButton(
              onPressed: () => Get.to(
                ViewData(
                  title: _titleController.text,
                  body: _bodyController.text,
                ),
              ),
              child: Text("Save HIVE"),
            )
          ],
        ),
      ),
    );
  }
}
