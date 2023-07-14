import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/main_screen/main_screen.dart';
import 'package:myapp/utils/color.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_spinner.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void completed() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => OuterLayerScreen(),
  //     ),
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 5), completed);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: ScreenUtil().setSp(10),
          //   vertical: ScreenUtil().setSp(10),
          // ),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(40),
              vertical: ScreenUtil().setSp(50),
            ),
            child: Column(
              children: [
                OurSizedBox(),
                OurSizedBox(),
                OurSizedBox(),
                Image.asset(
                  "assets/images/weather_logo.png",
                  height: ScreenUtil().setSp(175),
                  width: ScreenUtil().setSp(175),
                  fit: BoxFit.cover,
                ),
                Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(35),
                    fontWeight: FontWeight.w600,
                    color: darklogoColor,
                  ),
                ),
                OurSpinner(),
                OurSizedBox(),
                OurElevatedButton(
                  title: "Skip",
                  function: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: MainScreen(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                    child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Powered by ",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.w600,
                            // color: Colors.black,
                          )
                          // style: paratext,
                          ),
                      TextSpan(
                        text: 'Utsav Shrestha',
                        style: TextStyle(
                          color: darklogoColor,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: ScreenUtil().setSp(40),
      //   margin: EdgeInsets.symmetric(
      //     horizontal: ScreenUtil().setSp(5),
      //     vertical: ScreenUtil().setSp(10),
      //   ),
      //   child: Center(
      //       child: RichText(
      //     text: TextSpan(
      //       children: <TextSpan>[
      //         TextSpan(
      //             text: "Powered by ",
      //             style: TextStyle(
      //               fontSize: ScreenUtil().setSp(15),
      //               fontWeight: FontWeight.w600,
      //               color: Colors.black,
      //             )
      //             // style: paratext,
      //             ),
      //         TextSpan(
      //           text: 'Utsav Shrestha',
      //           style: TextStyle(
      //             color: darklogoColor,
      //             fontWeight: FontWeight.w600,
      //             fontSize: ScreenUtil().setSp(15),
      //           ),
      //         )
      //       ],
      //     ),
      //   )),
      // ),
    );
  }
}
