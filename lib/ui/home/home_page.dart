import 'package:flutter/material.dart';
import 'package:testing/configs/app_color.dart';
import 'package:testing/configs/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _HomePage();
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: AppColor.lightPrimary,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Notes",
            style: AppTextStyle.headerMainStyle,
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
                hintStyle: const TextStyle(color: AppColor.lightPlaceholder),
                suffixIcon: const Icon(
                  Icons.search_sharp,
                  color: AppColor.darkPrimary,
                )),
          ),
          const SizedBox(height: 27,),
          Text(
            "Note List",
            style: AppTextStyle.semiBoldStyle.copyWith(fontSize: 24),
          )
        ],
      ),
    );
  }
}
