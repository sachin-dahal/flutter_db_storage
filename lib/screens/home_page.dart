import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_db_storage/data/models/data_model.dart';
import 'package:flutter_db_storage/screens/view_data.dart';
import 'package:flutter_db_storage/utility/bloc/data_bloc.dart';
import 'package:flutter_db_storage/utility/bloc/data_event.dart';
import 'package:flutter_db_storage/utility/bloc/data_state.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  final box = Hive.box('todo');
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DataBloc>(context);
    TextEditingController _titleController = TextEditingController();
    TextEditingController _bodyController = TextEditingController();

    return Scaffold(
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is NotInsertingDataState) {
            return Container(
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
                    onPressed: () {
                      bloc.add(ViewDataEvent());
                      box.add(
                        DataModel(
                          title: _titleController.text,
                          body: _bodyController.text,
                        ),
                      );

                      Get.to(ViewData());
                    },
                    child: Text("Save HIVE"),
                  ),
                  SizedBox(height: 40.0),
                  RaisedButton(
                    onPressed: () => Get.to(ViewData()),
                    child: Text("View Data"),
                  ),
                ],
              ),
            );
          } else if (state is InsertingDataState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataInsertedState) {
            return ViewData();
          } else {
            return Center(
              child: Text("Some Error Occurred!"),
            );
          }
        },
      ),
    );
  }
}
