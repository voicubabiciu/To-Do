import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:to_do/features/add_to_do/presentation/pages/mobile/add_todo_mobile_screen.dart';

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, sizingInformation) {
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          return Container(
            color: Colors.red,
          );
        case DeviceScreenType.tablet:
          return Container(
            color: Colors.green,
          );
        case DeviceScreenType.mobile:
          return const AddToDoMobileScreen();
        default:
          return Container(
            color: Colors.blue,
          );
      }
    });
  }
}
