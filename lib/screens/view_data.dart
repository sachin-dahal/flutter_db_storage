import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_db_storage/utility/bloc/data_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ViewData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('todo');
    // final bloc = BlocProvider.of<DataBloc>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10.0,
                    child: ListTile(
                      title: Text(box.getAt(index).title),
                      subtitle: Text(box.getAt(index).body),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          box.deleteAt(index);
                          // bloc.add(ViewDataEvent());
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
