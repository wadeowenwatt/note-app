import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/app_provider/theme_provider.dart';
import 'package:testing/configs/app_color.dart';
import 'package:testing/configs/app_text_style.dart';
import 'package:testing/database/disk_storage.dart';
import 'package:testing/database/shared_preference.dart';
import 'package:testing/model/screen_theme.dart';
import 'package:testing/ui/home/home_provider.dart';
import 'package:testing/ui/note_detail/note_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.storage}) : super(key: key);

  final DiskStorage storage;

  @override
  Widget build(BuildContext context) {
    return _HomePage(
      diskStorage: storage,
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key, required this.diskStorage}) : super(key: key);

  final DiskStorage diskStorage;

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
  }

  void initialListFile(HomeProvider homeProvider) async {
    widget.diskStorage.getAllFilesInDirectory().then((listFiles) {
      homeProvider.files = listFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    initialListFile(homeProvider);
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.isDark
              ? AppColor.themeDark.backgroundColor
              : AppColor.themeLight.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Notes",
                  style: AppTextStyle.headerMainStyle.copyWith(
                    color: themeProvider.isDark
                        ? AppColor.themeDark.textColor
                        : AppColor.themeLight.textColor,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    fillColor: AppColor.lightSecondary,
                    hintText: "Search your note's title here ...",
                    hintStyle:
                        const TextStyle(color: AppColor.lightPlaceholder),
                    suffixIcon: const Icon(
                      Icons.search_sharp,
                      color: AppColor.darkPrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                Text(
                  "Note List",
                  style: AppTextStyle.semiBoldStyle.copyWith(
                    fontSize: 24,
                    color: themeProvider.isDark
                        ? AppColor.themeDark.textColor
                        : AppColor.themeLight.textColor,
                  ),
                ),
                _buildListNote(),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteDetail(
                        isNewFile: true,
                        indexFile: DiskStorage.numberFile,
                        storage: widget.diskStorage,
                      ),
                    ),
                  );
                },
                backgroundColor: AppColor.greenAccent,
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  themeProvider.changeTheme();
                },
                backgroundColor: AppColor.greenAccent,
                child: const Icon(Icons.change_circle_outlined),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListNote() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: homeProvider.files.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteDetail(
                  isNewFile: false,
                  indexFile: index,
                  storage: widget.diskStorage,
                ),
              ),
            );
          },
          child: Card(
            color: AppColor.lightSecondary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "test${index}.txt",
                style: const TextStyle(
                  color: AppColor.lightPlaceholder,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
