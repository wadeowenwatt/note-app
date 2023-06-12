import 'package:flutter/material.dart';
import 'package:testing/database/disk_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.storage}) : super(key: key);

  final DiskStorage storage;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              ElevatedButton(
                onPressed: () {
                  widget.storage.readFile().then((value) {
                    setState(() {
                      text = value;
                    });
                  });
                },
                child: Text("read"),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.storage.writeFile("Test");
                },
                child: Text("write"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
