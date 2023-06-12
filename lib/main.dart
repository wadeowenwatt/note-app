import 'package:flutter/material.dart';
import 'package:testing/app_provider/theme_provider.dart';
import 'package:testing/ui/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return ThemeProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
        ),
        // home: MyHomePage(
        //   storage: DiskStorage(),
        // ),
        home: const HomePage(),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     fontFamily: 'Poppins',
    //   ),
    //   // home: MyHomePage(
    //   //   storage: DiskStorage(),
    //   // ),
    //   home: const HomePage(),
    // );
  }
}
