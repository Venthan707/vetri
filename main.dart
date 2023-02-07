import 'dart:io';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'cert.dart';
import 'login/login.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1700,
          minWidth: 350,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.autoScale(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL')
          ]),
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}

// Container(
// height: double.infinity,
// width: double.infinity,
// color: Colors.white70,
// padding: const EdgeInsets.all(8),
// child: FutureBuilder<List<banner>>(
// future: Fatchbanner(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// List<banner> studentlist = snapshot.data as List<banner>;
// return ListView.builder(
// itemCount: studentlist.length,
// itemBuilder: (context, index) {
// return
//
// });
// }
// if (snapshot.hasError) {
// print(snapshot.error.toString());
// return Text('error');
// }
// return Center(
// child: Container(
// height: 150,
// child: CircularProgressIndicator(
// color: Colors.red,
// )));
// },
// ),
// ),
