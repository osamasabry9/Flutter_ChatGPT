import 'package:flutter/material.dart';

import '../../../app/constants.dart';

class HomeButtonWidget extends StatelessWidget {
  final String textData;
  final IconData iconData;
  final VoidCallback? onTap;
  const HomeButtonWidget(
      {Key? key, required this.textData, this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 95,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Constants.darkColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Constants.glowBoxShadow,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              textData,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
