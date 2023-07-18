import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/app_binding/my_bindings.dart';
import 'package:myapp/db/db_helper.dart';
import 'package:myapp/screens/help_screen/splash_screen.dart';
import 'package:myapp/screens/outer_layer/outer_layer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>(DatabaseHelper.authenticationDB);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child, Widget) {
        return GetMaterialApp(
          title: "Weather App",
          initialBinding: MyBinding(),
          builder: (context, widget) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!);
          },
          home: OuterLayerScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          // theme: ThemeData(
          // scaffoldBackgroundColor: Color(0xffb8cdce),
          // Provider.of<CurrentTheme>(context).darkTheme == false
          //     ? Color.fromARGB(255, 255, 255, 255)
          //     : null,
          // brightness: Provider.of<CurrentTheme>(context).darkTheme
          //     ? Brightness.dark
          //     : Brightness.light,
          // primarySwatch: Colors.amber,
          // ),
        );
      },
      // child: LoginScreen(),
    );
  }
}
