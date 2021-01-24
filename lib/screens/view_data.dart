import 'package:flutter/material.dart';
import 'package:flutter_db_storage/data/models/data_model.dart';

class ViewData extends StatelessWidget {
  final String title;
  final String body;

  ViewData({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    DataModel _dataModel = DataModel(title: title, body: body);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Card(
              elevation: 10.0,
              child: ListTile(
                title: Text(_dataModel.title ?? "t"),
                subtitle: Text(_dataModel.body ?? "b"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
