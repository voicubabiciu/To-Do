import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new to do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            TextFormField(
              maxLines: 20,
              decoration: InputDecoration(
                  labelText: 'Details'
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
    );
  }
}
