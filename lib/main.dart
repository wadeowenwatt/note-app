import 'package:flutter/material.dart';
import 'package:testing/app_provider/theme_provider.dart';
import 'package:testing/database/disk_storage.dart';
import 'package:testing/ui/home/home_provider.dart';
import 'package:testing/ui/note_detail/note_detail.dart';
import 'package:testing/ui/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
        ),
        // home: MyHomePage(
        //   storage: DiskStorage(),
        //   indexFile: DiskStorage.numberFile,
        //   isNewFile: true,
        // ),
        home: HomePage(
          storage: DiskStorage(),
        ),
      ),
    );
  }
}
