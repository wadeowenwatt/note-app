import 'package:flutter/material.dart';
import 'package:testing/configs/app_color.dart';
import 'package:testing/database/disk_storage.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({
    Key? key,
    required this.storage,
    required this.indexFile,
    required this.isNewFile,
  }) : super(key: key);

  final DiskStorage storage;
  final int indexFile;
  final bool isNewFile;

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  bool isNewFile = false;
  TextEditingController textEditingController = TextEditingController();
  String content = "";

  @override
  void initState() {
    super.initState();
    isNewFile = widget.isNewFile;
    initFileContent();
  }

  void initFileContent() async {
    if (!isNewFile) {
      content = await widget.storage.readSpecificFile(widget.indexFile);
    }
    textEditingController.text = content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightSecondary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColor.lightPlaceholder,
                    ),
                  ),
                  Text(
                    isNewFile ? "My New Note" : "test${widget.indexFile}.txt",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightPlaceholder),
                  ),
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter your note..."),
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isNewFile) {
            widget.storage.writeNewFile(textEditingController.text);
          } else {
            widget.storage.writeSpecificFile(
                textEditingController.text, widget.indexFile);
          }
          // UnFocus keyboard
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        backgroundColor: AppColor.greenAccent,
        child: const Icon(Icons.save),
      ),
    );
  }
}
