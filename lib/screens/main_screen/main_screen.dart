import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darklogoColor,
        title: Text(
          "Weather App",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(25),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(12.5),
          vertical: ScreenUtil().setSp(12.5),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text("Main Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
