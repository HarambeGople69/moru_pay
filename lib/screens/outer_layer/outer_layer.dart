import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/screens/help_screen/splash_screen.dart';
import 'package:myapp/screens/main_screen/main_screen.dart';
import '../../db/db_helper.dart';

class OuterLayerScreen extends StatefulWidget {
  const OuterLayerScreen({Key? key}) : super(key: key);

  @override
  _OuterLayerScreenState createState() => _OuterLayerScreenState();
}

class _OuterLayerScreenState extends State<OuterLayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable:
            Hive.box<int>(DatabaseHelper.authenticationDB).listenable(),
        builder: (context, Box<int> boxs, child) {
          int value = boxs.get("state", defaultValue: 0)!;
          print("===========");
          print(value);
          print("===========");
          return value == 0 ? HelpScreen() : MainScreen();
        },
      ),
    );
  }
}
