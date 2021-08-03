
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  const CardItem({required this.title, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text( DateFormat('dd-MM-yyyy – kk:mm').format(dateTime)),
        leading: Icon(Icons.note),
      )
    );
  }
}
