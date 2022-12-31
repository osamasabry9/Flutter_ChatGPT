import 'package:chat_gpt/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/routes_manager.dart';
import '../../core/utils/strings_manager.dart';
import 'widgets/home_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: AppSize.s60,
                ),
                Image.asset(ImageAssets.appLogo),
              ],
            ),
            Column(
              children: [
                HomeButtonWidget(
                  textData: AppStrings.imageGeneration,
                  iconData: Icons.image_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.imageRoute);
                  },
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                HomeButtonWidget(
                  textData: AppStrings.textCompletion,
                  iconData: Icons.text_fields_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.textRoute);
                  },
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                HomeButtonWidget(
                  textData: "Chat ",
                  iconData: Icons.chat_bubble_rounded,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.chatRoute);
                  },
                ),
              ],
            ),
            const Text(
              "ChatGPT",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
